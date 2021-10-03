//
//  Movements.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import Foundation

struct Movements: Codable, Hashable {
    let movement: [Movement]
    
    enum CodingKeys: String, CodingKey {
        case movement = "movimientos"
    }
}

struct Movement: Codable, Hashable {
    let date: String
    let description: String
    let ammount: String
    let type: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case date = "fecha"
        case description = "descripcion"
        case ammount = "monto"
        case type = "tipo"
        case id
    }
}
