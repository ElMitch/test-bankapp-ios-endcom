//
//  MovementsTableViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class MovementsTableViewCell: UITableViewCell {
    static let identifier = "MovementsCell_identifier"
    
    private let roundedView = UIView()
    private var movementsSV = UIStackView()
    private let sectionTitle = BoldLabel()
    private let nameOfMovement = BoldLabel()
    private let dateOfMovement = BoldLabel()
    private let ammountOfMovement = BoldLabel()
    private let seeMoreButton = AttributeButton()
    private let seeMoreImage = UIImageView()
    private let singleLine = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .white
        
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        sectionTitle.translatesAutoresizingMaskIntoConstraints = false
        ammountOfMovement.translatesAutoresizingMaskIntoConstraints = false
        singleLine.translatesAutoresizingMaskIntoConstraints = false
        seeMoreButton.translatesAutoresizingMaskIntoConstraints = false
        seeMoreImage.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(roundedView)
        roundedView.addSubview(sectionTitle)
        roundedView.addSubview(ammountOfMovement)
        roundedView.addSubview(singleLine)
        roundedView.addSubview(seeMoreButton)
        roundedView.addSubview(seeMoreImage)
        
        movementsSV = UIStackView(arrangedSubviews: [nameOfMovement, dateOfMovement])
        movementsSV.axis = .vertical
        movementsSV.alignment = .leading
        movementsSV.distribution = .fill
        movementsSV.spacing = 5
        movementsSV.translatesAutoresizingMaskIntoConstraints = false
        
        roundedView.addSubview(movementsSV)
        
        roundedView.backgroundColor = .softGray
        singleLine.backgroundColor = .lineGray
        
        NSLayoutConstraint.activate([
            roundedView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 17),
            roundedView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -17),
            roundedView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            
            sectionTitle.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 16),
            sectionTitle.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 26),
            sectionTitle.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -10),
            
            movementsSV.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 5),
            movementsSV.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 26),
            movementsSV.trailingAnchor.constraint(equalTo: ammountOfMovement.leadingAnchor, constant: 20),
            
            ammountOfMovement.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -34),
            ammountOfMovement.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 5),
            
            singleLine.topAnchor.constraint(equalTo: movementsSV.bottomAnchor, constant: 5),
            singleLine.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 16),
            singleLine.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: -16),
            singleLine.heightAnchor.constraint(equalToConstant: 1),
            singleLine.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -1)
        ])
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configWithTitle() {
        sectionTitle.setText(with: "Movimientos Recientes", and: .title)
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 19)
        ])
        roundedView.layer.cornerRadius = 8
        roundedView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        movementsSV.isHidden = true
        ammountOfMovement.isHidden = true
        singleLine.isHidden = true
        seeMoreButton.isHidden = true
    }
    
    func configWithMovement() {
        nameOfMovement.setText(with: "UBER BV", and: .description)
        dateOfMovement.setText(with: "10/05/2021", and: .date)
        ammountOfMovement.setText(with: "- $250.00", and: .description)
        NSLayoutConstraint.activate([
            roundedView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
        sectionTitle.isHidden = true
        seeMoreButton.isHidden = true
    }
    
    func configWithButton() {
        
        seeMoreButton.setNormalTitleWithBlue("Ver Todos Los Movimientos")
        seeMoreImage.image = UIImage(named: "movements")
        
        roundedView.layer.cornerRadius = 8
        roundedView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        NSLayoutConstraint.activate([
            seeMoreImage.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 17),
            seeMoreImage.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 25),
            seeMoreImage.heightAnchor.constraint(equalToConstant: 14),
            seeMoreImage.widthAnchor.constraint(equalToConstant: 14),
            
            seeMoreButton.leadingAnchor.constraint(equalTo: seeMoreImage.trailingAnchor, constant: 10),
            seeMoreButton.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 20),
            seeMoreButton.bottomAnchor.constraint(equalTo: roundedView.bottomAnchor, constant: -13)
        ])
        
        movementsSV.isHidden = true
        ammountOfMovement.isHidden = true
        singleLine.isHidden = true
        sectionTitle.isHidden = true
    }
    
    
}
