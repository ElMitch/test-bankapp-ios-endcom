//
//  Account.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import Foundation

struct Accounts: Codable, Hashable {
    let accounts: [Account]
    
    enum CodingKeys: String, CodingKey {
        case accounts = "cuenta"
    }
}

struct Account: Codable, Hashable {
    let account: Int
    let name: String
    let lastSession: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case account = "cuenta"
        case name = "nombre"
        case lastSession = "ultimaSesion"
        case id
    }
}

