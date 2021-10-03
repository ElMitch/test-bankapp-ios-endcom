//
//  AccountsTableViewCell.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class AccountsTableViewCell: UITableViewCell {
    static let identifier = "AccountsCell_identifier"
    
    private enum TypeOfBalance: Int, CaseIterable {
        case general = 0
        case incomes = 1
        case expenses = 2
    }
    
    private var collectionView: UICollectionView!
    private var balance: Balance!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .white
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 243, height: 125)
        collectionView = UICollectionView(frame: contentView.frame, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            collectionView.heightAnchor.constraint(equalToConstant: 125),
            collectionView.widthAnchor.constraint(equalToConstant: 243)
        ])
        
        configureCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func passBalance(with balance: Balance) {
        self.balance = balance
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AccountCollectionViewCell.self, forCellWithReuseIdentifier: AccountCollectionViewCell.identifier)
        
        collectionView.backgroundColor = .clear
    }
    
}

extension AccountsTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        TypeOfBalance.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountCollectionViewCell.identifier, for: indexPath) as! AccountCollectionViewCell
        let type = TypeOfBalance(rawValue: indexPath.row)
        switch type {
        case .general:
            cell.configWith(type: "Saldo general en cuentas", balance: balance.generalBalance)
        case .incomes:
            cell.configWith(type: "Total de ingresos", balance: balance.income)
        case .expenses:
            cell.configWith(type: "Total de egresos", balance: balance.expenses)
        default:
            break
        }
        return cell
    }
}
