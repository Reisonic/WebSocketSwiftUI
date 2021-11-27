//
//  Model.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import Foundation

class Model{
    
    struct SendingMessage: Encodable {
        
        let message: String
        let user: String
        
    }

    struct ReceiveMessage: Hashable {
        
        let message: String
        let user: String
        let system: Bool
        
    }
}
