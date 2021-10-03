//
//  Endpoint.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit
import Alamofire

final class Endpoint {
    
    static let base: String = "http://bankapp.endcom.mx/api/bankappTest/"
    
    enum Action: String {
        case account = "cuenta"
        case balances = "saldos"
        case cards = "tarjetas"
        case movements = "movimientos"
    }
    
    static func with(action: Action) -> String {
        let url = "\(base)\(action.rawValue)"
        debugPrint(url)
        return url
    }
}
