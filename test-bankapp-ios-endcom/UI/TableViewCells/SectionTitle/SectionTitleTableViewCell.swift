//
//  SectionTitleTableViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

protocol SectionTitleCellDelegate: AnyObject {
    func goToForm()
}

class SectionTitleTableViewCell: UITableViewCell {
    static let identifier = "SectionTitleCell_identifier"
    
    private let firstButton = AttributeButton()
    private let secondButton = AttributeButton()
    weak var delegate: SectionTitleCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .white
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(firstButton)
        contentView.addSubview(secondButton)
        
        NSLayoutConstraint.activate([
            firstButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            firstButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            firstButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 23),
            
            secondButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            secondButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            secondButton.leadingAnchor.constraint(equalTo: firstButton.trailingAnchor, constant: 24)
        ])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configOneButton() {
        firstButton.setTitleWithBlue("+ Agregar una tarjeta de débito o crédito")
        secondButton.isHidden = true
        firstButton.addTarget(self, action: #selector(addNewCard), for: .touchUpInside)
    }
    
    func configTwoButtons() {
        firstButton.setTitleWithBlue("Mis Cuentas")
        secondButton.setTitleWithGray("Enviar Dinero")
    }
    
    @objc func addNewCard() {
        delegate?.goToForm()
    }
    
}
