//
//  HomeViewController.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class HomeViewController: UITableViewController {
    
    private enum Sections: Int, CaseIterable {
        case user
        case account
        case cards
        case movements
    }
    
    private var headerView = HeaderViewNavItem()
    private var accounts: [Account] = []
    private var balances: [Balance] = []
    private var cards: [Card] = []
    private var movements: [Movement] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        fetchInfo()
    }
    
    func setupView() {
        navigationController?.navigationBar.barTintColor = .white
        navigationItem.titleView = headerView.setLogoInNavBar()
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.layoutMargins.bottom = 10
        tableView.separatorInset.bottom = 10
        
        tableView.register(UserInfoTableViewCell.self, forCellReuseIdentifier: UserInfoTableViewCell.identifier)
        tableView.register(SectionTitleTableViewCell.self, forCellReuseIdentifier: SectionTitleTableViewCell.identifier)
        tableView.register(AccountsTableViewCell.self, forCellReuseIdentifier: AccountsTableViewCell.identifier)
        tableView.register(CardTableViewCell.self, forCellReuseIdentifier: CardTableViewCell.identifier)
        tableView.register(MovementsTableViewCell.self, forCellReuseIdentifier: MovementsTableViewCell.identifier)
    }
    
    private func fetchInfo() {
        NetworkManager.shared.getAccount { accountsResponse in
            self.accounts = accountsResponse.accounts
            self.tableView.reloadData()
        }
        NetworkManager.shared.getBalances { balanceResponse in
            self.balances = balanceResponse.balance
            self.tableView.reloadData()
        }
        NetworkManager.shared.getCards { cardsResponse in
            self.cards = cardsResponse.card
            self.tableView.reloadData()
        }
        NetworkManager.shared.getMovements { movementResponse in
            self.movements = movementResponse.movement.sorted { $0.id > $1.id }
            self.tableView.reloadData()
        }
    }
    
}

extension HomeViewController {
    // MARK: - Datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        Sections.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = Sections(rawValue: section) else { fatalError("Out of bounds") }
        
        switch section {
        case .user:
            return accounts.count
        case .account:
            return balances.count + 1
        case .cards:
            return cards.count + 1
        case .movements:
            return movements.count == 0 ? 0 : 5
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Sections(rawValue: indexPath.section) else { fatalError("Out of bounds") }
        
        if section == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier, for: indexPath) as! UserInfoTableViewCell
            cell.configWith(with: accounts[indexPath.row])
            return cell
        }
        
        if section == .account {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.identifier, for: indexPath) as! SectionTitleTableViewCell
                cell.configTwoButtons()
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: AccountsTableViewCell.identifier, for: indexPath) as! AccountsTableViewCell
                cell.passBalance(with: balances[indexPath.row - 1])
                return cell
            }
        }
        
        if section == .cards {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.identifier, for: indexPath) as! SectionTitleTableViewCell
                cell.delegate = self
                cell.configOneButton()
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: CardTableViewCell.identifier, for: indexPath) as! CardTableViewCell
                cell.configureWith(card: cards[indexPath.row - 1])
                return cell
            }
        }
        
        if section == .movements {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: MovementsTableViewCell.identifier, for: indexPath) as! MovementsTableViewCell
                cell.configWithTitle()
                return cell
            } else if indexPath.row < 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: MovementsTableViewCell.identifier, for: indexPath) as! MovementsTableViewCell
                cell.configWith(movement: movements[indexPath.row - 1])
                return cell
            } else if indexPath.row == 4 {
                let cell = tableView.dequeueReusableCell(withIdentifier: MovementsTableViewCell.identifier, for: indexPath) as! MovementsTableViewCell
                cell.configWithButton()
                return cell
            }
        }
        
        return UITableViewCell()
    }
}

extension HomeViewController: SectionTitleCellDelegate {
    func goToForm() {
        let form = FormNewCardViewController()
        navigationController?.pushViewController(form, animated: true)
    }
}
