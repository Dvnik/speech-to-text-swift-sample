#測試用的Google Speech-to-Text專案

使用iOS14.4，swift 5實作

參考範例：[GoogleCloudPlatform/ios-docs-samples](https://github.com/GoogleCloudPlatform/ios-docs-samples)

- rest是使用web api，不用套件就能直接使用
- grpc則是引用google的api套件，主要是Object-C撰寫所以需要一個Bridging檔案連結
- Streaming是講話即辨識，Nonstreaming先錄音後分析
