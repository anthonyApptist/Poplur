//
//  CustomTextFieldContainer.swift
//  ColourBook
//
//  Created by Mark Meritt on 2016-12-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

import Foundation
import UIKit

class CustomTextFieldContainer: UIView, UITextFieldDelegate {
    
    var underLine: UIView!
    var textField: UITextField!
    
    var placeholder : String!
    var selectedPlaceholder: String!
    var validator: String!
    var isAnimated: Bool = false
    var validationError: String!
    
    override init(frame: CGRect) {
        super.init(frame:frame);
        initialSetup()
        
        
        
    }
    
    func initialSetup() {
        
        textField = UITextField(frame:CGRect(x:0, y: 0, width: 215.6, height: 36.6))
        textField.backgroundColor = UIColor.white
        textField.addBorder()
        textField.layer.cornerRadius = 5.1
        textField.textAlignment = .center
        textField.textColor = UIColor.black
        textField.font = UIFont.init(name: "MyriadPro-Cond", size: 20)
        textField.spellCheckingType = .no
        
        textField.delegate = self
           self.addSubview(textField)
        
       
        
        
        
    }
    
    
    func setup(placeholder: String!, validator: String!, type: String!){
        
        self.placeholder = placeholder
        self.selectedPlaceholder = placeholder.uppercased()
        self.validator = validator
        
        if(type == "email") {
            textField.keyboardType = .emailAddress
            textField.autocapitalizationType = .none
            textField.spellCheckingType = .no
            textField.autocorrectionType = .no
            
        } else if (type == "password") {
            textField.keyboardType = .default
            textField.isSecureTextEntry = true
            textField.spellCheckingType = .no
            textField.autocapitalizationType = .none
            textField.autocorrectionType = .no
            
        } else {
            textField.keyboardType = .default
            textField.spellCheckingType = .no
        }
        
        
    }
    
    func validate() -> Bool {
        self.validationError = "";
        
        if(self.validator == "optional") {
            return true
        }
        
        if(self.validator == "required") {
            if(self.textField.text?.isBlank)! {
                self.validationError = "blank"
                return false
            }
        }
        
        if(self.validator == "email") {
            if(self.textField.text?.isBlank)! {
                self.validationError = "blank"
                return false
            }
            
            if(!(self.textField.text?.isEmail)!) {
                self.validationError = "not_email"
                return false
            }
        }
        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
       
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
        self.textField.resignFirstResponder()
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialSetup()
        
        
    }
   
    
   
}
