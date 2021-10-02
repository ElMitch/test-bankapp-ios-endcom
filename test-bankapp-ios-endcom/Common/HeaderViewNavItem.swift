//
//  HeaderViewNavItem.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class HeaderViewNavItem: UIImageView {
    
    func setLogoInNavBar() -> UIImageView {
        let logo = UIImage(named: "logo")
        let imageView = UIImageView(image: logo)
        return imageView
    }
}
