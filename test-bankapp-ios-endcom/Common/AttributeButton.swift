//
//  UnderlineButton.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class AttributeButton: UIButton {
    
    private enum Constants {
        static let underlineBlueButton: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 18),
            .foregroundColor: UIColor.oceanBlue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        static let underlineGrayButton: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 18),
            .foregroundColor: UIColor.blueGray,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        static let blueButton: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 12),
            .foregroundColor: UIColor.oceanBlue
        ]
        static let cancelAndAddButton: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 16),
            .foregroundColor: UIColor.white
        ]
    }
    
    func setTitleWithBlue(_ title: String) {
        let attTitle = NSAttributedString(string: title, attributes: Constants.underlineBlueButton)
        setAttributedTitle(attTitle, for: .normal)
    }
    
    func setTitleWithGray(_ title: String) {
        let attTitle = NSAttributedString(string: title, attributes: Constants.underlineGrayButton)
        setAttributedTitle(attTitle, for: .normal)
    }
    
    func setNormalTitleWithBlue(_ title: String) {
        let attTitle = NSAttributedString(string: title, attributes: Constants.blueButton)
        setAttributedTitle(attTitle, for: .normal)
    }
    
    func cancelStyle(_ title: String) {
        let attTitle = NSAttributedString(string: title, attributes: Constants.cancelAndAddButton)
        self.backgroundColor = .lineGray
        self.layer.cornerRadius = 3
        setAttributedTitle(attTitle, for: .normal)
    }
    
    func addStyle(_ title: String) {
        let attTitle = NSAttributedString(string: title, attributes: Constants.cancelAndAddButton)
        self.backgroundColor = .clearGreen
        self.layer.cornerRadius = 3
        setAttributedTitle(attTitle, for: .normal)
    }
}
