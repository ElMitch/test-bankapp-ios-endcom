//
//  FormNewCardViewController.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 02/10/21.
//

import UIKit

class FormNewCardViewController: UIViewController {
    
    private enum Constants {
        static let titleLabel: [NSAttributedString.Key: Any] = [
            .font: UIFont.roboto(.regular, size: 18),
            .foregroundColor: UIColor.darkBlue
        ]
    }
    
    private var headerView = HeaderViewNavItem()
    private var cardImage = CardOfAccountImageView()
    private var addCardLabel = UILabel()
    private var numberOfCardTextField = FormTextField()
    private var accountTextField = FormTextField()
    private var issureTextField = FormTextField()
    private var nameTextField = FormTextField()
    private var branchTextField = FormTextField()
    private var statusTextField = FormTextField()
    private var balanceTextField = FormTextField()
    private var typeOfAccountTextField = FormTextField()
    private var cancelButton = AttributeButton()
    private var addButton = AttributeButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavBar()
        setupView()
        configInfo()
    }
    
    private func configNavBar() {
        navigationController?.navigationBar.barTintColor = .white
        let backImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        self.navigationController?.navigationBar.topItem?.backButtonTitle = ""
        navigationController?.navigationBar.tintColor = .oceanBlue
        navigationItem.titleView = headerView.setLogoInNavBar()
    }
    
    private func setupView() {
        view.backgroundColor = .softGray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        cardImage.translatesAutoresizingMaskIntoConstraints = false
        addCardLabel.translatesAutoresizingMaskIntoConstraints = false
        numberOfCardTextField.translatesAutoresizingMaskIntoConstraints = false
        accountTextField.translatesAutoresizingMaskIntoConstraints = false
        issureTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        branchTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        balanceTextField.translatesAutoresizingMaskIntoConstraints = false
        typeOfAccountTextField.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        
        numberOfCardTextField.delegate = self
        accountTextField.delegate = self
        issureTextField.delegate = self
        nameTextField.delegate = self
        branchTextField.delegate = self
        statusTextField.delegate = self
        balanceTextField.delegate = self
        typeOfAccountTextField.delegate = self
        
        numberOfCardTextField.keyboardType = .numberPad
        balanceTextField.keyboardType = .numberPad
        
        numberOfCardTextField.addTarget(self, action: #selector(didChangeText(textField:)), for: .editingChanged)
        cancelButton.addTarget(self, action: #selector(returnToHome), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(showJsonAlert), for: .touchUpInside)
        
        view.addSubview(cardImage)
        view.addSubview(addCardLabel)
        view.addSubview(cancelButton)
        view.addSubview(addButton)
        
        let firstSV = UIStackView(arrangedSubviews: [ accountTextField, issureTextField ])
        firstSV.axis = .horizontal
        firstSV.alignment = .fill
        firstSV.distribution = .fillEqually
        firstSV.spacing = 13
        
        let secondSV = UIStackView(arrangedSubviews: [ statusTextField, balanceTextField ])
        secondSV.axis = .horizontal
        secondSV.alignment = .fill
        secondSV.distribution = .fillEqually
        secondSV.spacing = 13
        
        let mainSV = UIStackView(arrangedSubviews: [ numberOfCardTextField, firstSV, nameTextField, branchTextField, secondSV, typeOfAccountTextField ])
        mainSV.axis = .vertical
        mainSV.alignment = .center
        mainSV.distribution = .equalCentering
        mainSV.spacing = 10
        mainSV.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainSV)
        
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 51),
            cardImage.heightAnchor.constraint(equalToConstant: 55),
            cardImage.widthAnchor.constraint(equalToConstant: 73),
            cardImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            
            addCardLabel.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 6),
            addCardLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 0),
            
            numberOfCardTextField.heightAnchor.constraint(equalToConstant: 38),
            accountTextField.heightAnchor.constraint(equalToConstant: 38),
            issureTextField.heightAnchor.constraint(equalToConstant: 38),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            branchTextField.heightAnchor.constraint(equalToConstant: 38),
            statusTextField.heightAnchor.constraint(equalToConstant: 38),
            balanceTextField.heightAnchor.constraint(equalToConstant: 38),
            typeOfAccountTextField.heightAnchor.constraint(equalToConstant: 38),
            
            mainSV.topAnchor.constraint(equalTo: addCardLabel.bottomAnchor, constant: 55),
            mainSV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            mainSV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            numberOfCardTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            numberOfCardTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            accountTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            issureTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            nameTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            nameTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            branchTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            branchTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            statusTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            balanceTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            typeOfAccountTextField.leadingAnchor.constraint(equalTo: mainSV.leadingAnchor, constant: 0),
            typeOfAccountTextField.trailingAnchor.constraint(equalTo: mainSV.trailingAnchor, constant: 0),
            
            cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 53),
            cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            cancelButton.heightAnchor.constraint(equalToConstant: 48),
            cancelButton.widthAnchor.constraint(equalToConstant: 100),
            
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -53),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -48),
            addButton.heightAnchor.constraint(equalToConstant: 48),
            addButton.widthAnchor.constraint(equalToConstant: 100)
            
        ])
    }
    
    private func configInfo() {
        cardImage.normal()
        addCardLabel.attributedText = .init(string: "Asociar Tarjeta", attributes: Constants.titleLabel)
        numberOfCardTextField.setGrayPlaceHolder("Número de tarjeta")
        accountTextField.setGrayPlaceHolder("Cuenta")
        issureTextField.setGrayPlaceHolder("Issure")
        nameTextField.setGrayPlaceHolder("Nombre de tarjeta")
        branchTextField.setGrayPlaceHolder("Marca")
        statusTextField.setGrayPlaceHolder("Estatus")
        balanceTextField.setGrayPlaceHolder("Saldo")
        typeOfAccountTextField.setGrayPlaceHolder("Tipo de cuenta")
        addButton.addStyle("Agregar")
        cancelButton.cancelStyle("Cancelar")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func showJsonAlert() {
        let alert = UIAlertController(title: "Funcionalidad JSON",
                                      message: """
                                                    {
                                                    tarjeta: "\(self.numberOfCardTextField.text ?? "nil")",
                                                    cuenta: "\(self.accountTextField.text  ?? "nil")",
                                                    issure: "\(self.issureTextField.text  ?? "nil")",
                                                    nombre: "\(self.nameTextField.text  ?? "nil")",
                                                    marca: "\(self.branchTextField.text  ?? "nil")",
                                                    estatus: "\(self.statusTextField.text  ?? "nil")",
                                                    saldo: \(self.balanceTextField.text  ?? "nil"),
                                                    tipo: "\(self.typeOfAccountTextField.text  ?? "nil")",
                                                                }
                                                    """,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func returnToHome() {
        navigationController?.popViewController(animated: true)
    }

    @objc func didChangeText(textField:UITextField) {
        textField.text = self.modifyCreditCardString(creditCardString: textField.text!)
    }
    
    func modifyCreditCardString(creditCardString : String) -> String {
         let trimmedString = creditCardString.components(separatedBy: .whitespaces).joined()

         let arrOfCharacters = Array(trimmedString)
         var modifiedCreditCardString = ""

         if(arrOfCharacters.count > 0) {
             for i in 0...arrOfCharacters.count-1 {
                 modifiedCreditCardString.append(arrOfCharacters[i])
                 if((i+1) % 4 == 0 && i+1 != arrOfCharacters.count){
                     modifiedCreditCardString.append(" ")
                 }
             }
         }
         return modifiedCreditCardString
     }
    
}

extension FormNewCardViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == numberOfCardTextField {
            numberOfCardTextField.setSelected()
        } else if textField == accountTextField {
            accountTextField.setSelected()
        } else if textField == issureTextField {
            issureTextField.setSelected()
        } else if textField == nameTextField {
            nameTextField.setSelected()
        } else if textField == branchTextField {
            branchTextField.setSelected()
        } else if textField == statusTextField {
            statusTextField.setSelected()
        } else if textField == balanceTextField {
            balanceTextField.setSelected()
        } else if textField == typeOfAccountTextField {
            typeOfAccountTextField.setSelected()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == numberOfCardTextField {
            numberOfCardTextField.setDeselect()
        } else if textField == accountTextField {
            accountTextField.setDeselect()
        } else if textField == issureTextField {
            issureTextField.setDeselect()
        } else if textField == nameTextField {
            nameTextField.setDeselect()
        } else if textField == branchTextField {
            branchTextField.setDeselect()
        } else if textField == statusTextField {
            statusTextField.setDeselect()
        } else if textField == balanceTextField {
            balanceTextField.setDeselect()
        } else if textField == typeOfAccountTextField {
            typeOfAccountTextField.setDeselect()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
         let newLength = (textField.text ?? "").count + string.count - range.length
         if(textField == numberOfCardTextField) {
             return newLength <= 19
         }
         return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == numberOfCardTextField {
            accountTextField.becomeFirstResponder()
        } else if textField == accountTextField {
            issureTextField.becomeFirstResponder()
        } else if textField == issureTextField {
            nameTextField.becomeFirstResponder()
        } else if textField == nameTextField {
            branchTextField.becomeFirstResponder()
        } else if textField == branchTextField {
            statusTextField.becomeFirstResponder()
        } else if textField == statusTextField {
            balanceTextField.becomeFirstResponder()
        } else if textField == balanceTextField {
            typeOfAccountTextField.becomeFirstResponder()
        } else if textField == typeOfAccountTextField {
            typeOfAccountTextField.resignFirstResponder()
        }
        return true
    }
}
