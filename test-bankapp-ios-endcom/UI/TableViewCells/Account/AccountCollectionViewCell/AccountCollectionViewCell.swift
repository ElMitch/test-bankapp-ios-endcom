//
//  AccountCollectionViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell {
    static let identifier = "AccountCollectionCell_identifier"
    
    private enum Constants {
        static let typeOfAccount: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.medium, size: 18),
            .foregroundColor: UIColor.oceanBlue
        ]
        static let balance: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 22),
            .foregroundColor: UIColor.clearGreen
        ]
    }
    
    private let cardOfAccount = UIView()
    private let typeOfAccount = UILabel()
    private let balanceLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        
        cardOfAccount.translatesAutoresizingMaskIntoConstraints = false
        typeOfAccount.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardOfAccount.backgroundColor = .darkBlue
        typeOfAccount.numberOfLines = 0
        
        contentView.addSubview(cardOfAccount)
        cardOfAccount.addSubview(typeOfAccount)
        cardOfAccount.addSubview(balanceLabel)
        
        cardOfAccount.layer.cornerRadius = 3
        
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalToConstant: 243),
            contentView.heightAnchor.constraint(equalToConstant: 125),
            
            cardOfAccount.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardOfAccount.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            cardOfAccount.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            cardOfAccount.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            typeOfAccount.topAnchor.constraint(equalTo: cardOfAccount.topAnchor, constant: 16),
            typeOfAccount.leadingAnchor.constraint(equalTo: cardOfAccount.leadingAnchor, constant: 17),
            typeOfAccount.trailingAnchor.constraint(equalTo: cardOfAccount.trailingAnchor, constant: -94),
            
            balanceLabel.trailingAnchor.constraint(equalTo: cardOfAccount.trailingAnchor, constant: -15),
            balanceLabel.bottomAnchor.constraint(equalTo: cardOfAccount.bottomAnchor, constant: -20),
            balanceLabel.leadingAnchor.constraint(equalTo: cardOfAccount.leadingAnchor, constant: 109)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configWith(type: String, balance: Int) {
        typeOfAccount.attributedText = .init(string: type, attributes: Constants.typeOfAccount)
        balanceLabel.attributedText = .init(string: balance.toCurrency(), attributes: Constants.balance)
    }
    
}
