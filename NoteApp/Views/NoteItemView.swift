//
//  NoteItemView.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import SwiftUI

struct NoteItemView: View {
    @StateObject var viewModel = NoteItemViewModel()
    let item: NoteItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title2)
                    .bold()
                
                Text("Edited \(Date(timeIntervalSince1970: item.editTime).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.bottom, 5)
                
                Text(item.content)
                    .font(.system(size: 20))
                    .frame(maxHeight: 100)
            }
        }
    }
}

#Preview {
    NoteItemView(
        item: .init(id: "123",
                    title: "Get Milk",
                    editTime: Date().timeIntervalSince1970,
                    content: "Go Get milk at Shop"
                   )
    )
}
