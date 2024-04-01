//
//  NoteAppApp.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 22/3/2567 BE.
//

import SwiftUI
import FirebaseCore

@main
struct NoteAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
