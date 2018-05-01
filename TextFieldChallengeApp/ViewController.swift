//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//Create outlets for each text field
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var characterCountLabel: UILabel!
    
//Text field delegate objects
    let zipDelegate = ZipCodeTextFieldDelegate()
    let cashDelegate = CashTextFieldDelegate()
    let randomColorTextFieldDelegate = RandomColorTextFieldDelegate()
    
//Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       
//Set the label to be hidden
        self.characterCountLabel.isHidden = true
        
// Set the three delegates
    self.textField1.delegate = zipDelegate
    self.textField2.delegate = cashDelegate
    self.textField3.delegate =  randomColorTextFieldDelegate
}
   
//Text Field Delegate Methods
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//What will the new text be if we return true
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        
//Hide the label if the newText is empty string
        self.characterCountLabel.isHidden = (newText.length == 0)
        
//Write the length of newText into the label
        self.characterCountLabel.text = String(newText.length)
        
//Returning true gives the text field permission to change its text
        return true;


}

}
