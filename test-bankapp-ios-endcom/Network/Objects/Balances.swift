//
//  Balances.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import Foundation

struct Balances: Codable, Hashable {
    let balance: [Balance]
    
    enum CodingKeys: String, CodingKey {
        case balance = "saldos"
    }
}

struct Balance: Codable, Hashable {
    let number: Int
    let generalBalance: Int
    let income: Int
    let expenses: Int
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case number = "cuenta"
        case generalBalance = "saldoGeneral"
        case income = "ingresos"
        case expenses = "gastos"
        case id
    }
}
