//
//  SignUpScreen.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-21.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class SignUpScreen: PoplurScreen {
    
    var usernameBtn: CircleButton!
    var passwordBtn: CircleButton!
    
    var nameTextField: CustomTextFieldContainer!
    var pwTextField: CustomTextFieldContainer!
    
    
    let checkMarkImg = UIImage(named: "checkmark")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name = PoplurScreenName.signUp
        self.setScreenDirections(current: self, leftScreen: HomeScreen(), rightScreen: nil, downScreen: nil, middleScreen:  ProfileScreen(), upScreen: nil)
        self.setRemoteEnabled(leftFunc: true, rightFunc: false, downFunc: false, middleFunc: false, upFunc: false)
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: 375, height:667)
        backgroundImage = UIImage(named: "bitmap")!
        backgroundImageView.image = backgroundImage
        
        
        let banner = UIView(frame: CGRect(x: 0, y: 354, width: 375, height: 42))
        banner.backgroundColor = UIColor.black
        self.view.addSubview(banner)
        
        let label =  UILabel(frame: CGRect(x: 31, y: 364, width: 313, height: 21))
        label.font = UIFont(name: "MyriadPro-Cond", size: 21.6)
        label.text = "sign up to begin voting"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.setSpacing(space: 2.08)
        self.view.addSubview(label)
        
        usernameBtn = CircleButton(frame: CGRect(x: 27, y: 61, width: 95.4, height:91.2))
        usernameBtn.addText(string: "name", color: 0)
        usernameBtn.setColorClear()
        self.view.addSubview(usernameBtn)
        
        passwordBtn = CircleButton(frame: CGRect(x: 27, y: 174.8, width:95.4, height: 91.2))
        passwordBtn.addText(string: "pw", color: 0)
        passwordBtn.setColorClear()
        self.view.addSubview(passwordBtn)
       
        nameTextField = CustomTextFieldContainer(frame: CGRect(x: 134.4, y: 89.5, width:215.6, height: 36.6))
 
        self.view.addSubview(nameTextField)
 
        pwTextField = CustomTextFieldContainer(frame: CGRect(x: 134.4, y:201.5, width: 215.6, height: 36.6))

        self.view.addSubview(pwTextField)
 
        nameTextField.setup(placeholder: "Email", validator: "email", type: "email")
        pwTextField.setup(placeholder: "Password", validator: "required", type: "password")
        
        
       self.nameTextField.textField.delegate = self
        self.pwTextField.textField.delegate = self
        
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if(textField == nameTextField.textField) {
            self.usernameBtn.animateRadius(scale: 1.5, soundOn: false)
        }
        
        if(textField == pwTextField.textField) {
            self.passwordBtn.animateRadius(scale: 1.5, soundOn: false)
        }
        
        
    }
    
    
    func validate(showError: Bool) -> Bool {
        ErrorHandler.sharedInstance.errorMessageView.resetImagePosition()
        if(!nameTextField.validate()) {
            if(showError) {
                if(nameTextField.validationError == "blank") {
                    ErrorHandler.sharedInstance.show(message: "Email Field Cannot Be Blank", container: self)
                }
                if(nameTextField.validationError == "not_email") {
                    ErrorHandler.sharedInstance.show(message: "You should double-check that email address....", container: self)
                }
            }
            return false
        }
        
        if(!pwTextField.validate()) {
            if(showError) {
                if(pwTextField.validationError == "blank") {
                    ErrorHandler.sharedInstance.show(message: "Password Field Cannot Be Blank", container: self)
                }
            }
            return false
        }
        return true
    }
    
    
    func loginButtonFunction(_ sender: AnyObject) {

        _ = validate(showError: true)
        
        if(!validate(showError: true)) {
            return
        } else {
            AuthService.instance.login(email: self.nameTextField.textField.text!, password: self.pwTextField.textField.text!) {
                Completion in
                
                if(Completion.0 == nil) {
                    self.app.userDefaults.set(self.nameTextField.textField.text!, forKey: "userName")
                    self.app.userDefaults.synchronize()
                    currentState = remoteStates[4]
                    print("remote state is: " + currentState)
                    NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])
                } else {
                    ErrorHandler.sharedInstance.show(message: Completion.0!, container: self)
                    
                }
            }
        }

    }
    
    override func textFieldDidEndEditing(_ textField: UITextField) {
        
        if nameTextField.textField.text?.isEmpty == false && pwTextField.textField.text?.isEmpty == false {
            
            self.setRemoteEnabled(leftFunc: true, rightFunc: false, downFunc: false, middleFunc: true, upFunc: false)
            self.remote.middleBtn?.setColourVerifiedGreen()
            self.remote.middleBtn?.animateWithNewImage(scale: 1.2, soundOn: true, image: checkMarkImg!)
            self.remote.middleBtn?.addTarget(self, action: #selector(self.loginButtonFunction(_:)), for: .touchUpInside)
            
        }
    }
    
  
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.textField.resignFirstResponder()
        pwTextField.textField.resignFirstResponder()
    }
   
 

    
}
