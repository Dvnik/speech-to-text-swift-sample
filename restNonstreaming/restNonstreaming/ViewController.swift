//
//  ViewController.swift
//  restNonstreaming
//
//  look in https://github.com/GoogleCloudPlatform/ios-docs-samples
//  Created on 2021/4/14.
//

import UIKit
import AVFoundation

let API_KEY = "YOUR_API_KEY"
let SAMPLE_RATE = 16000

class ViewController: UIViewController
{
    //MARK:- Outlet
    @IBOutlet weak var textView: UITextView!
    
    //MARK:- Get/Set Field
    var soundFilePath:URL {
        get {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            return paths[0].appendingPathComponent("sound.caf")
        }
    }
    
    
    //MARK:- Values
    var audioSession: AVAudioSession!
    
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    //MARK:- Functions
    func initSessions()
    {
        audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playAndRecord, mode: .default)
            try audioSession.setActive(true)
            audioSession.requestRecordPermission { (allowed) in
                DispatchQueue.main.async {
                    if allowed {
                        print("User Allowed")
                    } else {
                        print("failed to record!")
                    }
                }
            }
        }
        catch {
            print("\(#function) error: \(error)")
        }
        
    }
    
    func finishAudio()
    {
        if audioRecorder != nil
        {
            audioRecorder.stop()
            audioRecorder = nil
            print("audioRecorder Stop")
        }
        
        if audioPlayer != nil
        {
            audioPlayer.stop()
            audioPlayer = nil
            print("audioPlayer Stop")
        }
    }
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSessions()
    }

    //MARK:- Actions
    @IBAction func recordAudio(_ sender: Any)
    {
        stopAudio(sender)// Stop working audio
        
        let settings = [
            AVEncoderBitRateKey: 16,
            AVSampleRateKey: SAMPLE_RATE,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: soundFilePath, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            print("\(#function) Start")
        }
        catch {
            print("\(#function) erro :\(error)")
        }
    }
    
    @IBAction func playAudio(_ sender: Any)
    {
        stopAudio(sender)// Stop working audio
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundFilePath)
            audioPlayer.delegate = self
            audioPlayer.volume = 1.0
            audioPlayer.play()
            print("\(#function) Start")
        }
        catch {
            print("\(#function) erro :\(error)")
        }
    }
    
    @IBAction func stopAudio(_ sender: Any)
    {
        finishAudio()
    }
    
    @IBAction func processAudio(_ sender: Any)
    {
        stopAudio(sender)// Stop working audio
        
        var service = "https://speech.googleapis.com/v1/speech:recognize"
        service.append("?key=")
        service.append(API_KEY)
        
        var audioData: Data!
        do {
            audioData = try Data(contentsOf: soundFilePath)
        }
        catch {
            print("\(#function) audio catch erro :\(error)")
            return
        }
        let configRequest:[String:Any] = [
            "encoding":"LINEAR16",
            "sampleRateHertz":SAMPLE_RATE,
            "languageCode":"zh-TW",
            "maxAlternatives":30
        ]
        let audioRequest = ["content": audioData.base64EncodedString(options: Data.Base64EncodingOptions.init(rawValue: 0))]
        let requestDictionary = [
            "config":configRequest,
            "audio":audioRequest
        ]
        //
        var requestData:Data!
        do {
            requestData = try JSONSerialization.data(withJSONObject: requestDictionary, options: JSONSerialization.WritingOptions.init(rawValue: 0))
        }
        catch {
            print("\(#function) request catch erro :\(error)")
            return
        }
        
        let path = service
        let sendUrl = URL(string: path)!
        var request = URLRequest(url: sendUrl)
        request.addValue(Bundle.main.bundleIdentifier!, forHTTPHeaderField: "X-Ios-Bundle-Identifier")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = requestData
        request.httpMethod = "POST"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let result = data
                {
                    let stringResult = String(data: result, encoding: .utf8)
                    self.textView.text = stringResult
                    print("RESULT:\(stringResult)")
                }
            }
            print("Response:\(response)")
            print("error:\(error)")
            
        }
        task.resume()
    }
    
    
    
    
}

extension ViewController:AVAudioRecorderDelegate, AVAudioPlayerDelegate
{
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishAudio()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if !flag {
            finishAudio()
        }
    }
}
