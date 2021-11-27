//
//  RoomCell.swift
//  ChatWebSocket
//
//  Created by Владислав Космачев.
//

import SwiftUI

struct RoomCellView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill").resizable().frame(width: 50, height: 50)
            VStack{
                HStack{
                    Text("Username")
                    Spacer()
                }
                HStack{
                    Text("Message")
                    Spacer()
                }
            }
            Spacer()
        }
    }
}
