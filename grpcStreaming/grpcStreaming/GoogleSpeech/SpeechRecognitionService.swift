//模仿 google ios 版的範例複製，grpc stream版本

import Foundation
import googleapis

// API_KEY要自己到Google Cloud Platform
let API_KEY : String = "YOUR_API_KEY"
let HOST = "speech.googleapis.com"// 主機位置，照著範例指向的位置設定
//將Function結構形態化成一個變數去傳遞
typealias SpeechRecognitionCompletionHandler = (StreamingRecognizeResponse?, NSError?) -> (Void)

class SpeechRecognitionService
{
    //MARK: - Values
    var sampleRate: Int = 16000// 基礎頻率，可更動
    private var streaming = false // 辨別是否在串流中
    // googleapis Speech
    private var client : Speech!
    private var writer : GRXBufferedPipe!
    private var call : GRPCProtoCall!
    // Instance，供單例模式使用
    static let sharedInstance = SpeechRecognitionService()
    
    //MARK: - Functions
    func streamAudioData(_ audioData: NSData, completion: @escaping SpeechRecognitionCompletionHandler)
    {
        // 沒有啟動Stream的話會嘗試啟動
        if !streaming
        {
            // if we aren't already streaming, set up a gRPC connection
            client = Speech(host:HOST)
            writer = GRXBufferedPipe()
            call = client.rpcToStreamingRecognize(withRequestsWriter: writer,
                                                  eventHandler: {
                                                    (done, response, error)
                                                    in
                                                    completion(response, error as NSError?)
                                                  })
            // authenticate using an API key obtained from the Google Cloud Console
            // 設定API_KEY,關鍵字應該是要上Google Cloud Console去看
            call.requestHeaders.setObject(NSString(string: API_KEY), forKey: NSString(string:"X-Goog-Api-Key"))
            // if the API key has a bundle ID restriction, specify the bundle ID like this
            // 設定bundle id，不確定API_KEY的後台不設限制的話是否要用到
            call.requestHeaders.setObject(NSString(string: Bundle.main.bundleIdentifier!), forKey: NSString(string:"X-Ios-Bundle-Identifier"))
            
            print("HEADERS:\(call.requestHeaders)")
            
            call.start()//啟動protocall
            streaming = true//設定Stream開始
            
            // send an initial request message to configure the service
            //送出語音辨識的設定
            let recognitionConfig = RecognitionConfig()
            recognitionConfig.encoding =  .linear16//編碼
            recognitionConfig.sampleRateHertz = Int32(sampleRate) //頻率，以Int32儲存
            recognitionConfig.languageCode = "zh-TW" // 辨識語系設定
            // Maximum number of recognition hypotheses to be returned.
            //設定辨識後返回的最大數量結果，有效值為0-30
            recognitionConfig.maxAlternatives = 30
            // 設定返回的時間戳記
            recognitionConfig.enableWordTimeOffsets = true
            //串流錄製設定
            let streamingRecognitionConfig = StreamingRecognitionConfig()
            streamingRecognitionConfig.config = recognitionConfig // 上述RecognitionConfig
            streamingRecognitionConfig.singleUtterance = false
            streamingRecognitionConfig.interimResults = true
            // StreamingRecognizeRequest 設定
            let streamingRecognizeRequest = StreamingRecognizeRequest()
            streamingRecognizeRequest.streamingConfig = streamingRecognitionConfig// 上述StreamingRecognitionConfig
            // 將設定的結果寫入
            writer.writeValue(streamingRecognizeRequest)
        }
        // send a request message containing the audio data
        let streamingRecognizeRequest = StreamingRecognizeRequest()
        streamingRecognizeRequest.audioContent = audioData as Data
        writer.writeValue(streamingRecognizeRequest)// 另一個StreamingRecognizeRequest是寫入audioData
    }
    
    func stopStreaming()
    {
        if (!streaming) {
          return
        }
        writer.finishWithError(nil)
        streaming = false
    }
    
    func isStreaming() -> Bool
    {
        return streaming
    }
}
