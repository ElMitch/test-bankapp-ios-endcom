//
//  UserInfoTableViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    static let identifier = "UserCell_identifier"
    
    private let nameOfUser = BoldLabel()
    private let dateOfLastLogIn = BoldLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.backgroundColor = .darkBlue
        
        nameOfUser.translatesAutoresizingMaskIntoConstraints = false
        dateOfLastLogIn.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameOfUser)
        contentView.addSubview(dateOfLastLogIn)
        
        NSLayoutConstraint.activate([
            nameOfUser.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameOfUser.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            nameOfUser.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 21),
            
            dateOfLastLogIn.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateOfLastLogIn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            dateOfLastLogIn.leadingAnchor.constraint(equalTo: nameOfUser.trailingAnchor, constant: 8)
        ])
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configWith(with account: Account) {
        nameOfUser.setText(with: account.name, and: .white)
        var date = account.lastSession
        date.removeLast(9)
        dateOfLastLogIn.setText(with: "Ultimo inicio \(date)", and: .green)
    }
    
}
