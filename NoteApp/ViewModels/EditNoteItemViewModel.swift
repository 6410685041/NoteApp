//
//  EditNoteItemViewModel.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class EditNoteItemModel : ObservableObject {
    @Published var title = ""
    @Published var content = ""
    @Published var editTime = Date()
    @Published var showAlert = false
    @Published var item: NoteItem? = nil
    
    func save(item: NoteItem) {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        let itemId = item.id
        
        let editItem = NoteItem(
            id: itemId,
            title: title,
            editTime: Date().timeIntervalSince1970, 
            content: content
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("note")
            .document(itemId)
            .setData(editItem.asDictionary())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard !content.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
    
    func load(item: NoteItem) {
            title = item.title
            content = item.content
        }
}
