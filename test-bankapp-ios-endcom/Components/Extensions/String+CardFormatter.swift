//
//  String+CardFormatter.swift
//  test-bankapp-ios-endcom
//
//  Created by Mitch Samaniego on 03/10/21.
//

import Foundation

extension String {
    func modifyCreditCardString() -> String {
         let trimmedString = self.components(separatedBy: .whitespaces).joined()

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
