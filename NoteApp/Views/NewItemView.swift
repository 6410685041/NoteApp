//
//  NewNoteItemView.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Note")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TextField("Content", text: $viewModel.content, axis: .vertical)
                    .lineLimit(18, reservesSpace: true)
                    .textFieldStyle(DefaultTextFieldStyle())
                    
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields")
                )
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: .constant(true))
}
