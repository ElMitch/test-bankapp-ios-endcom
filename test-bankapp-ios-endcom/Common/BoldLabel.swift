//
//  BoldLabel.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class BoldLabel: UILabel {
    
    private enum Constants {
        static let whiteLabel: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 16),
            .foregroundColor: UIColor.white
        ]
        static let greenLabel: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 16),
            .foregroundColor: UIColor.clearGreen
        ]
        static let blueLabel: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 16),
            .foregroundColor: UIColor.darkBlue
        ]
        static let title: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 14),
            .foregroundColor: UIColor.darkBlue
        ]
        static let description: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 12),
            .foregroundColor: UIColor.darkBlue
        ]
        static let date: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 10),
            .foregroundColor: UIColor.blueGray
        ]
        static let ammount: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 10),
            .foregroundColor: UIColor.blueGray
        ]
    }
    
    enum Color {
        case white, green, blue, title, description, date
    }
    
    func setText(with text: String, and color: Color) {
        switch color {
        case .white:
            self.attributedText = .init(string: text, attributes: Constants.whiteLabel)
        case .blue:
            self.attributedText = .init(string: text, attributes: Constants.blueLabel)
        case .green:
            self.attributedText = .init(string: text, attributes: Constants.greenLabel)
        case .title:
            self.attributedText = .init(string: text, attributes: Constants.title)
        case .description:
            self.attributedText = .init(string: text, attributes: Constants.description)
        case .date:
            self.attributedText = .init(string: text, attributes: Constants.date)
        }
    }
}
