//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//

import Foundation
import UIKit

//Define Class
class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
    
//Text Field Delegate Method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        return newText.length <= 5
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true;
    }
}
