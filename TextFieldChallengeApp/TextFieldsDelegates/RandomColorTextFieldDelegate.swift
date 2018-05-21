//
//  RandomColorTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//

import Foundation
import UIKit

//Define class, subclass, and declare text field delegate protocol.
class RandomColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    var isEditable = true
    
//Create an array of colors
    let colors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .purple, .brown]
    
//create a method that will return a random color
    func randomColor() -> UIColor {
        let randomIndex = Int(arc4random() % UInt32(colors.count))
//choose colors from array using random number as index
        return colors[randomIndex]
    }
// Color of text in text field set to random color.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String)-> Bool {
        textField.textColor = self.randomColor()
       
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return isEditable
    }
    }

