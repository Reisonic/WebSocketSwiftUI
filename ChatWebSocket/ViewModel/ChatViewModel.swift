//
//  ChatViewModel.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import SwiftUI
import SwiftyJSON

class ChatViewModel: ObservableObject {
    
    @Published var messages: [Model.ReceiveMessage] = []
    @Published var message = ""
    @Published var user = "User1"
    
    var webSocket: URLSessionWebSocketTask
    
    func connect() {
        webSocket.receive(completionHandler: onReceive)
        webSocket.resume()
        debugPrint("connect")
    }
    
    func disconnect() {
        webSocket.cancel(with: .normalClosure, reason: nil)
        debugPrint("disconnect")
    }
    
    func onReceive(incoming: Result<URLSessionWebSocketTask.Message, Error>) {
        webSocket.receive(completionHandler: onReceive)
            if case .success(let message) = incoming {
                onMessage(message: message)
            }
            else if case .failure(let error) = incoming {
                debugPrint("Error", error)
            }
    }
    
    func onMessage(message: URLSessionWebSocketTask.Message) {
        if case .string(let text) = message {
            parseJSON(value: text)
        }
    }
    
    func send(message: String, user: String) {
        webSocket.send(.string(decodeJSON(message: message, user: user))) { error in
            if let error = error {
                debugPrint("Error sending message", error)
            }
        }
    }
    
    func parseJSON(value: String) {
        if (!value.isEmpty){
            let json = JSON(parseJSON: value)
            debugPrint(json)
            DispatchQueue.main.async {
                self.messages.append(Model.ReceiveMessage(message: json["message"].stringValue, user: json["user"].stringValue, system: json["system"].boolValue))
            }
        }
    }
    
    func decodeJSON(message:String, user:String) -> String{
        let message = Model.SendingMessage(message: message, user: user)
        guard let json = try? JSONEncoder().encode(message),
            let jsonString = String(data: json, encoding: .utf8)
        else {
            return ""
        }
        return jsonString
    }
    
    init() {
        let url = URL(string: Constants().webSocketAddress)!
        webSocket = URLSession.shared.webSocketTask(with: url)
        connect()
    }
    
    deinit {
        disconnect()
    }
}
