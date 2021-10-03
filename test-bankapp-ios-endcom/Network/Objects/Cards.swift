//
//  Cards.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import Foundation

struct Cards: Codable, Hashable {
    let card: [Card]
    
    enum CodingKeys: String, CodingKey {
        case card = "tarjetas"
    }
}

struct Card: Codable, Hashable {
    let card: String
    let name: String
    let balance: Int
    let state: String
    let type: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case card = "tarjeta"
        case name = "nombre"
        case balance = "saldo"
        case state = "estado"
        case type = "tipo"
        case id
    }
}
