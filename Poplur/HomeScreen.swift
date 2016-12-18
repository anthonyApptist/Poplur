//
//  ViewController.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-12.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class HomeScreen: PoplurScreen {
    
    @IBAction func loginBtnPressed(_ sender: AnyObject) {
        
        present(LogInScreen(), animated: false, completion: nil)
    }
    
    @IBAction func signUpBtnPressed(_ sender: AnyObject) {
        
        present(SignUpScreen(), animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name = PoplurScreenName.home
        self.setScreenDirections(current: self, left: LogInScreen(), right: LogInScreen(), down: LogInScreen(), middle: LogInScreen())
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
        
            let poplurLogo = CircleButton(frame: CGRect(x: 109, y: 82, width: 92, height: 88))
            poplurLogo.addBorder()
            poplurLogo.animateRadius(scale: 1.5, soundOn: true)
            poplurLogo.setColorClear()
            poplurLogo.addText(string: "poplur", color: 0)
            self.view.addSubview(poplurLogo)
            
            poplurLogo.translatesAutoresizingMaskIntoConstraints = false
            
            poplurLogo.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 80).isActive = true
            poplurLogo.bottomAnchor.constraint(equalTo: (self.banner?.topAnchor)!, constant: -45).isActive = true
            poplurLogo.heightAnchor.constraint(equalTo: poplurLogo.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            poplurLogo.widthAnchor.constraint(equalTo: poplurLogo.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            
            let poplurChannel = CircleButton(frame: CGRect(x: 190.57, y: 72, width: 92, height: 88))
            poplurChannel.addBorder()
            poplurChannel.animateRadius(scale: 1.5, soundOn: true)
            poplurChannel.setColorClear()
            poplurChannel.addText(string: "Music", color: 1)
            self.view.addSubview(poplurChannel)
            
            poplurChannel.translatesAutoresizingMaskIntoConstraints = false
            
            poplurChannel.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 167).isActive = true
            poplurChannel.bottomAnchor.constraint(equalTo: (self.banner?.topAnchor)!, constant: -68).isActive = true
            poplurChannel.heightAnchor.constraint(equalTo: poplurChannel.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            poplurChannel.widthAnchor.constraint(equalTo: poplurChannel.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true

            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            let loginBtn = CircleButton(frame: CGRect(x: 109, y:360, width: 92, height: 88))
            loginBtn.addBorder()
            loginBtn.animateRadius(scale: 1.5, soundOn: true)
            loginBtn.setColorClear()
            loginBtn.addText(string: "login", color: 0)
            loginBtn.addTarget(self, action: #selector(self.loginBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(loginBtn)
            
            loginBtn.translatesAutoresizingMaskIntoConstraints = false
            
            loginBtn.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 80).isActive = true
            loginBtn.topAnchor.constraint(equalTo: (self.banner?.bottomAnchor)!, constant: 68).isActive = true
            loginBtn.heightAnchor.constraint(equalTo: loginBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            loginBtn.widthAnchor.constraint(equalTo: loginBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            
            let signUpBtn = CircleButton(frame: CGRect(x:190.57, y: 350.7, width:92, height: 88))
            signUpBtn.addBorder()
            signUpBtn.animateRadius(scale: 1.5, soundOn: true)
            signUpBtn.setColorClear()
            signUpBtn.addText(string: "signup", color: 1)
            signUpBtn.addTarget(self, action: #selector(self.signUpBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(signUpBtn)
            
            signUpBtn.translatesAutoresizingMaskIntoConstraints = false
            
            signUpBtn.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 167).isActive = true
            signUpBtn.topAnchor.constraint(equalTo: (self.banner?.bottomAnchor)!, constant: 45).isActive = true
            signUpBtn.heightAnchor.constraint(equalTo: signUpBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            signUpBtn.widthAnchor.constraint(equalTo: signUpBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
        }

        
        banner?.createBannerWithText(text: "see the most poplur music near you")
      
    }
   
}

