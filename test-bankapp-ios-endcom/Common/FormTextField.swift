//
//  FormTextField.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class FormTextField: UITextField {
    
    private enum Constants {
        static let selected: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 14),
            .foregroundColor: UIColor.selectedPlaceholder
        ]
        static let unselected: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 14),
            .foregroundColor: UIColor.lineGray
        ]
    }
    
    func setGrayPlaceHolder(_ text: String) {
        self.attributedPlaceholder = .init(string: text, attributes: Constants.unselected)
        self.borderStyle = .line
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lineGray.cgColor
        self.layer.cornerRadius = 3
    }
    
    func setSelected() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clearGreen.cgColor
        self.layer.cornerRadius = 3
    }
    
    func setDeselect() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lineGray.cgColor
        self.layer.cornerRadius = 3
    }
}
