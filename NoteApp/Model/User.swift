//
//  User.swift
//  NoteApp
//
//  Created by ชลิศา ธรรมราช on 22/3/2567 BE.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
