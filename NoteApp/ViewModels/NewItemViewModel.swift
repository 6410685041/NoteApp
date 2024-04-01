//
//  NewItemViewModel.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var content = ""
    @Published var showAlert = false
    
    func save() {
        guard canSave else { return }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let newId = UUID().uuidString
        let newItem = NoteItem(
            id: newId,
            title: title,
            editTime: Date().timeIntervalSince1970,
            content: content
        )
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("note")
            .document(newId)
            .setData(newItem.asDictionary())
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
}
