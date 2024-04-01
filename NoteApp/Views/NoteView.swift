//
//  NoteView.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 31/3/2567 BE.
//

import SwiftUI
import SwiftUI
import FirebaseFirestoreSwift

struct NoteView: View {
    @StateObject var viewModel: NoteViewModel
    @FirestoreQuery var items: [NoteItem]
    @State private var selectedItem: NoteItem?
    @State private var isEditViewActive = false
    
    init(userId: String) {
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/note")
        self._viewModel = StateObject(wrappedValue:(NoteViewModel(userId: userId)))
    }
    
    var body: some View {
        NavigationView {
            NavigationStack{
                VStack {
                    List(items) { item in
                        Button(action: {
                                self.selectedItem = item
                                self.isEditViewActive = true
                            }) {
                                NoteItemView(item: item)
                            }
                            .swipeActions {
                                Button {
                                    viewModel.delete(id: item.id)
                                } label: { // Delete
                                    Image(systemName: "trash.fill")
                                }
                                .tint(.red)
                            }
                    }
                    .sheet(isPresented: $isEditViewActive) {
                        if let selectedItem = selectedItem {
                            EditNoteItemView(editItemPresented: $isEditViewActive, item: selectedItem)
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Note")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }

}

#Preview {
    NoteView(
        userId: "123"
    )
}
