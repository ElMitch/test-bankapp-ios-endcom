//
//  CardTableViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    static let identifier = "CardCell_identifier"
    
    private enum Constants {
        static let status: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 14),
            .foregroundColor: UIColor.clearGreen
        ]
        static let number: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.bold, size: 16),
            .foregroundColor: UIColor.darkBlue
        ]
        static let name: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 14),
            .foregroundColor: UIColor.darkBlue
        ]
        static let typeOfUser: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 12),
            .foregroundColor: UIColor.darkBlue
        ]
    }
    
    private let cardImage = CardOfAccountImageView()
    private let statusOfCard = UILabel()
    private let numberOfCard = UILabel()
    private let saldOfCard = UILabel()
    private let nameOfUser = UILabel()
    private let typeOfUser = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        saldOfCard.translatesAutoresizingMaskIntoConstraints = false
        
        let mainSV = UIStackView(arrangedSubviews: [ statusOfCard, numberOfCard, nameOfUser, typeOfUser ])
        mainSV.axis = .vertical
        mainSV.alignment = .leading
        mainSV.distribution = .fill
        mainSV.spacing = 8
        mainSV.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(cardImage)
        contentView.addSubview(saldOfCard)
        contentView.addSubview(mainSV)
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            cardImage.heightAnchor.constraint(equalToConstant: 55),
            cardImage.widthAnchor.constraint(equalToConstant: 73),
            
            mainSV.leadingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: 36),
            mainSV.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            mainSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            saldOfCard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            saldOfCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            saldOfCard.leadingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 11)
        ])
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureWith() {
        cardImage.active()
        statusOfCard.attributedText = .init(string: "Activa", attributes: Constants.status)
        numberOfCard.attributedText = .init(string: "5439 2401 1234 1234", attributes: Constants.number)
        nameOfUser.attributedText = .init(string: "Berenice García López", attributes: Constants.name)
        typeOfUser.attributedText = .init(string: "Titular", attributes: Constants.typeOfUser)
        saldOfCard.attributedText = .init(string: "$1,500", attributes: Constants.number)
    }
    
}
