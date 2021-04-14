//模仿 google ios 版的範例複製，grpc Nonstreaming版本

import Foundation
import googleapis


// API_KEY要自己到Google Cloud Platform
let API_KEY : String = "YOUR_API_KEY"
let HOST = "speech.googleapis.com"// 主機位置，照著範例指向的位置設定
//將Function結構形態化成一個變數去傳遞
typealias SpeechRecognitionCompletionHandler = (Any?) -> Void

class SpeechRecognitionService
{
    //MARK:- Values
    static let sharedInstance = SpeechRecognitionService()
    // googleapis Speech
    private var client : Speech!
    private var call : GRPCProtoCall!
    //MARK:- Functions
    
    func processAudioData(_ audioData:NSData, completion: @escaping SpeechRecognitionCompletionHandler)
    {
        let recognitionConfig = RecognitionConfig()
        recognitionConfig.encoding = .linear16//編碼
        recognitionConfig.sampleRateHertz = 16000//頻率，以Int32儲存
        recognitionConfig.languageCode = "zh-TW"// 辨識語系設定
        // Maximum number of recognition hypotheses to be returned.
        //設定辨識後返回的最大數量結果，有效值為0-30
        recognitionConfig.maxAlternatives = 30
        
        let recognitionAudio = RecognitionAudio()
        recognitionAudio.content = audioData as Data
        
        let recognizeRequest = RecognizeRequest()
        recognizeRequest.config = recognitionConfig
        recognizeRequest.audio = recognitionAudio
        
        client = Speech(host: HOST)
        
        call = client.rpcToRecognize(with: recognizeRequest,
                                     handler: {
                                        (response, error)
                                        in
                                        print("RESPONSE RECEIVED :\(response)")
                                        if let err = error
                                        {
                                            print("ERROR:\(err)")
                                            completion(err)
                                        }
                                        else
                                        {
                                            response?.resultsArray.forEach({ (item) in
                                                guard let result = item as? SpeechRecognitionResult else { return }
                                                    
                                                result.alternativesArray.forEach { (item) in
                                                    guard let alternative = item as? SpeechRecognitionAlternative else { return }
                                                    
                                                    let confidence = String.init(format: "%0.4f", alternative.confidence)
                                                    
                                                    print("ALTERNATIVE \(confidence), \(alternative.transcript!)")
                                                }
                                            })
                                            completion(response)
                                        }
                                     })
        // authenticate using an API key obtained from the Google Cloud Console
        // 設定API_KEY,關鍵字應該是要上Google Cloud Console去看
        call.requestHeaders.setObject(NSString(string: API_KEY), forKey: NSString(string:"X-Goog-Api-Key"))
        // if the API key has a bundle ID restriction, specify the bundle ID like this
        // 設定bundle id，不確定API_KEY的後台不設限制的話是否要用到
        call.requestHeaders.setObject(NSString(string: Bundle.main.bundleIdentifier!), forKey: NSString(string:"X-Ios-Bundle-Identifier"))
        print("HEADERS:\(call.requestHeaders)")
        
        call.start()//啟動protocall
    }
    
}
