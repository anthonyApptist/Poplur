//
//  LogInScreen.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-20.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class LogInScreen: PoplurScreen {
    
    var usernameBtn: CircleButton!
    var passwordBtn: CircleButton!
    
    var nameTextField: UITextField!
    var pwTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.banner?.initWithOffsetY(frame: (self.banner?.frame)!, offsetY: 55)
        self.name = PoplurScreenName.logIn
           self.setScreenDirections(current: self, left: HomeScreen(), right: HomeScreen(), down: HomeScreen(), middle: HomeScreen())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {

        self.usernameBtn = CircleButton(frame: CGRect(x: 27, y: 61, width: 95.4, height: 91.2))
        self.usernameBtn.addText(string: "name", color: 0)
        self.usernameBtn.setColorClear()
        self.usernameBtn.animateRadius(scale: 1.5, soundOn: false)
        self.view.addSubview(self.usernameBtn)
        
        }
        
        passwordBtn = CircleButton(frame: CGRect(x: 27, y: 174.8, width: 95.4, height:91.2))
        passwordBtn.addText(string: "pw", color: 0)
        passwordBtn.setColorClear()
        self.view.addSubview(passwordBtn)
        
        nameTextField = UITextField(frame: CGRect(x: 134.4, y: 89.5, width: 215.6, height: 36.6))
        nameTextField.addBorder()
        nameTextField.layer.cornerRadius = 5.1
        nameTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(nameTextField)
        
        pwTextField = UITextField(frame: CGRect(x:134.4, y:201.5, width: 215.6, height: 36.6))
        pwTextField.addBorder()
        pwTextField.layer.cornerRadius = 5.1
        pwTextField.layer.backgroundColor = UIColor.white.cgColor
        self.view.addSubview(pwTextField)
        
        let forgotPasswordBtn = UIButton(frame: CGRect(x: 106, y: 334, width: 164, height: 123))
        let forgotPasswordImg = UIImage(named: "forgotPw")
        
        forgotPasswordBtn.contentMode = .scaleAspectFill
        forgotPasswordBtn.setImage(forgotPasswordImg, for: .normal)
        self.view.addSubview(forgotPasswordBtn)
        
      
 //       banner?.createBannerWithText(text: "log in")
        
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
