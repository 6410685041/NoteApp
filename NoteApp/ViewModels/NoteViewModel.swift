//
//  NoteViewModel.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import Foundation
import FirebaseFirestore

class NoteViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("note")
            .document(id)
            .delete()
    }
}
