//
//  Contact.swift
//  ContactsApp
//
//  Created by andreea.ungureanu on 29.07.2022.
//

import Foundation

struct Contact: Codable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}
