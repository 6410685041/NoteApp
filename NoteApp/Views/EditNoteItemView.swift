//
//  EditNoteItemView.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import SwiftUI

struct EditNoteItemView: View {
    @StateObject var viewModel = EditNoteItemModel()
    @Binding var editItemPresented: Bool
    let item: NoteItem
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack {
            if isEditing {
                Form {
                    TextField(item.title, text: $viewModel.title)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField(item.content, text: $viewModel.content, axis: .vertical)
                        .lineLimit(20, reservesSpace: true)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Save", background: .pink) {
                        if viewModel.canSave {
                            viewModel.save(item: item)
                            editItemPresented = false
                        } else {
                            viewModel.showAlert = true
                        }
                    }
                }
                .onAppear{
                    viewModel.load(item: item)
                }
                .alert(isPresented: $viewModel.showAlert){
                    Alert(
                        title: Text("Error"),
                        message: Text("Please fill in all fields")
                    )
                }
                .padding(.vertical)
            } else {
                HStack(alignment: .top){
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.largeTitle)
                            .padding(.horizontal)
                            .padding(.top)
                        
                        Text("Edited \(Date(timeIntervalSince1970: item.editTime).formatted(date: .abbreviated, time: .shortened))")
                            .font(.footnote)
                            .foregroundColor(Color(.secondaryLabel))
                            .padding(.horizontal)
                            .padding(.bottom)
                        
                        ScrollView{
                            Text(item.content)
                        }.padding(.horizontal).padding(.bottom)
                    }
                    .onTapGesture {
                        isEditing = true  // Switch to editing mode when text is tapped
                    }
                }
            }
        }
    }
}

#Preview {
    EditNoteItemView(
        editItemPresented: .constant(true),
        item: .init(id: "123",
                    title: "Get Milk",
                    editTime: Date().timeIntervalSince1970,
                    content: "content"
                   )
    )
}
