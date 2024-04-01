//
//  NoteItem.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 22/3/2567 BE.
//

import Foundation

struct NoteItem: Codable, Identifiable {
    let id: String
    let title: String
    let editTime: TimeInterval
    let content: String
}
