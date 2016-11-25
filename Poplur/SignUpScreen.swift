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
        
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: self.calculateX(x:375), height: self.calculateY(y:667))
        backgroundImage = UIImage(named: "bitmap")!
        backgroundImageView.image = backgroundImage
        
        
        let banner = UIView(frame: CGRect(x: 0, y: self.calculateX(x:354), width: self.calculateY(y:375), height: self.calculateY(y:42)))
        banner.backgroundColor = UIColor.black
        self.view.addSubview(banner)
        
        let label =  UILabel(frame: CGRect(x: self.calculateX(x:31), y: self.calculateY(y:364), width: self.calculateX(x:313), height: self.calculateY(y:21)))
        label.font = UIFont(name: "MyriadPro-Cond", size: 21.6)
        label.text = "sign up to begin voting"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.setSpacing(space: 2.08)
        self.view.addSubview(label)
        
        usernameBtn = CircleButton(frame: CGRect(x: self.calculateX(x:27), y: self.calculateY(y:61), width: self.calculateX(x:95.4), height: self.calculateY(y:91.2)))
        usernameBtn.addText(string: "name", color: 0)
        usernameBtn.setColorClear()
        self.view.addSubview(usernameBtn)
        
        passwordBtn = CircleButton(frame: CGRect(x: self.calculateX(x:27), y: self.calculateY(y:174.8), width: self.calculateX(x: 95.4), height: self.calculateY(y: 91.2)))
        passwordBtn.addText(string: "pw", color: 0)
        passwordBtn.setColorClear()
        self.view.addSubview(passwordBtn)
        
        nameTextField = UITextField(frame: CGRect(x: self.calculateX(x:134.4), y: self.calculateY(y:89.5), width: self.calculateX(x:215.6), height: self.calculateY(y:36.6)))
        nameTextField.addBorder()
        nameTextField.layer.cornerRadius = 5.1
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(nameTextField)
        
        pwTextField = UITextField(frame: CGRect(x: self.calculateX(x:134.4), y: self.calculateY(y:201.5), width: self.calculateX(x:215.6), height: self.calculateY(y:36.6)))
        pwTextField.addBorder()
        pwTextField.layer.cornerRadius = 5.1
        pwTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(pwTextField)
        
        remote.delegate?.setRemoteDirection(up: HomeScreen(), down: HomeScreen(), left: HomeScreen(), right: HomeScreen(), middle: HomeScreen())
        
        
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
