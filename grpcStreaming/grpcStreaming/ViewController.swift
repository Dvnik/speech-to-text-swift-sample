//
//  ViewController.swift
//  grpcStreaming
//
//  Created on 2021/4/14.
//

import UIKit
import AVFoundation
import googleapis

let SAMPLE_RATE = 16000// 範例用的頻率

class ViewController: UIViewController
{
    
    //MARK: - Outlet
    @IBOutlet weak var textView: UITextView!
    
    
    //MARK: - Values
    var audioData: NSMutableData!

    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        AudioController.sharedInstance.delegate = self
    }

    //MARK:- Actions
    @IBAction func recordAudio(_ sender: Any)
    {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record)
        }
        catch {
            
        }
        audioData = NSMutableData()
        _ = AudioController.sharedInstance.prepare(specifiedSampleRate: SAMPLE_RATE)
        SpeechRecognitionService.sharedInstance.sampleRate = SAMPLE_RATE
        _ = AudioController.sharedInstance.start()
    }
    
    @IBAction func stopAudio(_ sender: Any)
    {
        _ = AudioController.sharedInstance.stop()
        SpeechRecognitionService.sharedInstance.stopStreaming()
    }
    
    

}

extension ViewController:AudioControllerDelegate
{
    func processSampleData(_ data: Data)
    {
        audioData.append(data)
        // We recommend sending samples in 100ms chunks
        let chunkSize : Int /* bytes/chunk */ = Int(0.1 /* seconds/chunk */
          * Double(SAMPLE_RATE) /* samples/second */
          * 2 /* bytes/sample */);
        
        if (audioData.length > chunkSize)
        {
            SpeechRecognitionService.sharedInstance.streamAudioData(audioData)
            {
                [weak self] (response, error) -> (Void)
                in
                guard let strongSelf = self else { return }
                
                if let error = error
                {
                    strongSelf.textView.text = error.localizedDescription
                }
                else if let response = response
                {
                    var finished = false
                    print(response)
                    
                    for result in response.resultsArray!
                    {
                        if let result = result as? StreamingRecognitionResult
                        {
                            if result.isFinal
                            {
                                finished = true
                            }
                        }
                    }
                    strongSelf.textView.text = response.description
                    if finished
                    {
                        strongSelf.stopAudio(strongSelf)
                    }
                }
            }
            self.audioData = NSMutableData()
        }
    }
    
    
}
