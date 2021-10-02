//
//  UIFont+appFonts.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

extension UIFont {
    enum RobotoStyle {
        case regular, bold, medium
    }
    
    static func roboto(_ style: RobotoStyle, size: CGFloat) -> UIFont {
        switch style {
        case .regular:
            return UIFont(name: "Roboto-Regular", size: size)!
        case .medium:
            return UIFont(name: "Roboto-Medium", size: size)!
        case .bold:
            return UIFont(name: "Roboto-Bold", size: size)!
        }
    }
    
}
