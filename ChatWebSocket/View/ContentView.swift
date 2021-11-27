//
//  ContentView.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination: ChatView().navigationTitle("User")){
                    RoomCellView()
                }
            }.listStyle(InsetListStyle()).navigationBarTitle("Chats").navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
