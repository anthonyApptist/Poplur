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
    
    var nameTextField: UITextField!
    var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.name = PoplurScreenName.signUp
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
        
        nameTextField = UITextField(frame: CGRect(x: 134.4, y: 89.5, width:215.6, height: 36.6))
        nameTextField.addBorder()
        nameTextField.layer.cornerRadius = 5.1
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(nameTextField)
        
        pwTextField = UITextField(frame: CGRect(x: 134.4, y:201.5, width: 215.6, height: 36.6))
        pwTextField.addBorder()
        pwTextField.layer.cornerRadius = 5.1
        pwTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(pwTextField)
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        pwTextField.resignFirstResponder()
    }
    
    func loginButtonFunction() {
        if let email = nameTextField.text , let password = pwTextField.text , (email.characters.count > 0 && password.characters.count > 0) {
            
            // call the login service
            AuthService.instance.login(email: email, password: password, onComplete: { (errorMessage, data) in
                if errorMessage != nil {
                    let alert = UIAlertController(title: "Error Authentication", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                else {
                    self.dismiss(animated: true, completion: nil)
//                    self.signoutButton.alpha = 1.0
                }
            })
        }
        else {
            let alert = UIAlertController(title: " Username and Password Required", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    
}
