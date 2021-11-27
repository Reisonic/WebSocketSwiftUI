//
//  MessageView.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import SwiftUI

struct MessageView:View{
    
    @State var text:String
    @State var user:String
    @State var system:Bool
    @State var ownUser:String = "User1"
    
    var body: some View{
        HStack{
            if (system == true){
                Text(text)
            } else {
                if (user != ownUser) {
                    Text(text).messageStyle(ownMessage: .constant(false))
                    Spacer()
                } else {
                    Spacer()
                    Text(text).messageStyle(ownMessage: .constant(true))
                }
            }
        }.padding()
    }
}

struct MessageStyle:ViewModifier{
    
    @Binding var ownMessage:Bool
    
    func body(content: Content) -> some View {
        content.padding(10)
            .foregroundColor(ownMessage ? Color.white : Color.black)
            .background(ownMessage ? Color.blue : Color(UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)))
            .cornerRadius(10)
    }
}

extension View{
    
    func messageStyle(ownMessage:Binding<Bool>) -> some View{
        self.modifier(MessageStyle(ownMessage: ownMessage))
    }
    
}
