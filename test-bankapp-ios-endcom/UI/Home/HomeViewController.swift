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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
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
            return 1
        case .account:
            return 2
        case .cards:
            return 3
        case .movements:
            return 5
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = Sections(rawValue: indexPath.section) else { fatalError("Out of bounds") }
        
        if section == .user {
            let cell = tableView.dequeueReusableCell(withIdentifier: UserInfoTableViewCell.identifier, for: indexPath) as! UserInfoTableViewCell
            cell.configWith(name: "Daniel Samaniego", date: "Ultimo inicio 08/06/2021")
            return cell
        }
        
        if section == .account {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: SectionTitleTableViewCell.identifier, for: indexPath) as! SectionTitleTableViewCell
                cell.configTwoButtons()
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: AccountsTableViewCell.identifier, for: indexPath)
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
                cell.configureWith()
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
                cell.configWithMovement()
                return cell
            } else if indexPath.row == 4{
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
