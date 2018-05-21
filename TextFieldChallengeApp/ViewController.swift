//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
//Properties
    let zipCodeDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let randomColorDelegate = RandomColorTextFieldDelegate()
    
//Create outlets for each text field
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    @IBOutlet weak var editSwitch: UISwitch!
    
    
//Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
// Set the three delegates
    self.textField1.delegate = self.zipCodeDelegate
    self.textField2.delegate = self.cashDelegate
    self.textField3.delegate = self.randomColorDelegate
//Set the edit switch
    self.editSwitch.setOn(true, animated: true)

}
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            var newText = textField.text! as NSString
            newText = newText.replacingCharacters(in: range, with: string) as NSString
            
            
            // hide the label if the newText will be an empty string
            self.characterCountLabel.isHidden = (newText.length == 0)
            
            // Write the length of newText into the label
            self.characterCountLabel.text = String(newText.length)
            
            // returning true gives the text field permission to change its text
            return true;
        }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if self.editSwitch.isOn {
        return true;
    }else{
        return false;
        
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
//Edit switch action and toggle.
 
    
    @IBAction func toggleEditSwitch(_ sender: Any) {
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
        (textField3.delegate as? RandomColorTextFieldDelegate)?.isEditable = (sender as AnyObject).isOn
}

}
