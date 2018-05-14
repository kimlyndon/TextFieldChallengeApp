//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Kim Lyndon on 5/1/18.
//  Copyright © 2018 Kim Lyndon. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UIViewController {
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
    self.editSwitch.setOn(false, animated: false)
    
}
   
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.editSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
//Edit switch action and toggle.
    @IBAction func editSwitch(_ sender: Any) {
    
        if !(sender as! UISwitch).isOn {
            self.textField3.resignFirstResponder()
        }
       
    }
    }
    

