//
//  ViewController.swift
//  grpcNonstreaming
//
//  Created by Trixie Lulamoon on 2021/4/14.
//

import UIKit
import AVFoundation
import googleapis

class ViewController: UIViewController
{
    //MARK:- Outlet
    @IBOutlet weak var textView: UITextView!
    //MARK:- Values
    var audioData: NSMutableData!
    

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioController.sharedInstance.delegate = self
    }

    
    //MARK:- Actions
    //開始錄音
    @IBAction func recordAudio(_ sender: Any)
    {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record)
        }
        catch {
            
        }
        // Set Audio Data
        audioData = NSMutableData()
        _ = AudioController.sharedInstance.prepare()
        _ = AudioController.sharedInstance.start()
    }
    //停止錄音
    @IBAction func stopAudio(_ sender: Any)
    {
        _ = AudioController.sharedInstance.stop()
        print("stopAudio")
    }
    //傳送錄音檔案並且分析語音結果
    @IBAction func processAudio(_ sender: Any)
    {
        SpeechRecognitionService.sharedInstance.processAudioData(self.audioData) { (object) in
            if let res = object as? RecognizeResponse
            {
                self.textView.text = res.description
            }
        }
    }
}

extension ViewController:AudioControllerDelegate
{
    // 增加語音檔案
    // 和Streaming不同的是，Streaming就要在這裡解析內容。
    func processSampleData(_ data: Data)
    {
        audioData.append(data)
    }
}
