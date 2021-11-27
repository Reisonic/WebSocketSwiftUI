//
//  ChatView.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import SwiftUI

struct ChatView: View {
    
    @StateObject private var chatVM = ChatViewModel()
    
    var body: some View {
        VStack{
            ScrollView{
                ForEach(chatVM.messages, id:\.self){ message in
                    MessageView(text: message.message, user: message.user, system: message.system)
                }
            }
            Spacer()
            Divider()
            HStack{
                TextField("Message", text: $chatVM.message).padding().background(Color.white).cornerRadius(25).shadow(radius: 10)
                Button(action: {
                    chatVM.send(message: chatVM.message, user: chatVM.user)
                }) {
                    Image(systemName: "paperplane.circle").resizable().frame(width: 50, height: 50)
                }
            }.padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
