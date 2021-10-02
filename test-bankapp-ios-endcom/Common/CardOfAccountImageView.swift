//
//  CardOfAccountImageView.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class CardOfAccountImageView: UIImageView {

    func active() {
        self.backgroundColor = .clear
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "activeCard")
    }
    
    func inactive() {
        self.backgroundColor = .clear
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "inactiveCard")
    }
    
    func normal() {
        self.backgroundColor = .clear
        self.contentMode = .scaleAspectFill
        self.image = UIImage(named: "normalCard")
    }
    
}
