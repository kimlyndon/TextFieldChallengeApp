//
//  CashTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//

import Foundation
import UIKit

//Define Class
class CashTextFieldDelegate: NSObject, UITextFieldDelegate {

//TextField Methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

//You will have to cast the string as an NSString.
        let oldText = textField.text! as NSString
        var newText = oldText.replacingCharacters(in: range, with: string)
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (newTextString.unicodeScalars) {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
    }
        }
// Format the new string
        if let numOfPennies = Int(digitText) {
            newText = "$" + self.dollarStringFromInt(numOfPennies) + "." + self.centsStringFromInt(numOfPennies)
            } else {
                newText = "$0.00"
        }
            textField.text = newText
            return false
        }
//Text field should begin with $0.00 and change from right to left when values are added.
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
    }
        }

//Hide the keyboard upon touch of return key.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true;
        
        }
        
    func dollarStringFromInt(_ value: Int) -> String {
            return String(value / 100)
        
        }
        
    func centsStringFromInt(_ value: Int) -> String {
            
            let cents = value % 100
            var centsString = String(cents)
            
            if cents < 10 {
                centsString = "0" + centsString
            }
            
            return centsString
    }
}





