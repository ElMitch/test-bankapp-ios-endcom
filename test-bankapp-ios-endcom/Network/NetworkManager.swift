//
//  NetworkManager.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import Foundation
import Alamofire

final class NetworkManager {
    static let shared = NetworkManager()
    
    func getAccount(completion: @escaping (Accounts) -> Void) {
        let endpointAction = Endpoint.with(action: .account)
        
        AF.request(endpointAction).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(Accounts.init(accounts: []))
            } else {
                let data = response.data
                let model = try! JSONDecoder().decode(Accounts.self, from: data!)
                completion(model)
            }
        }
    }
    
    func getBalances(completion: @escaping (Balances) -> Void) {
        let endpointAction = Endpoint.with(action: .balances)
        
        AF.request(endpointAction).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(Balances.init(balance: []))
            } else {
                let data = response.data
                let model = try! JSONDecoder().decode(Balances.self, from: data!)
                completion(model)
            }
        }
    }
    
    func getCards(completion: @escaping (Cards) -> Void) {
        let endpointAction = Endpoint.with(action: .cards)
        
        AF.request(endpointAction).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(Cards.init(card: []))
            } else {
                let data = response.data
                let model = try! JSONDecoder().decode(Cards.self, from: data!)
                completion(model)
            }
        }
    }
    
    func getMovements(completion: @escaping (Movements) -> Void) {
        let endpointAction = Endpoint.with(action: .movements)
        
        AF.request(endpointAction).responseJSON { response in
            if let error = response.error {
                debugPrint(error.localizedDescription)
                completion(Movements.init(movement: []))
            } else {
                let data = response.data
                let model = try! JSONDecoder().decode(Movements.self, from: data!)
                completion(model)
            }
        }
    }

    
    
    
}
