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
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        backgroundImage = UIImage(named: "bitmap")!
        backgroundImageView.image = backgroundImage
        
      let margins = self.view.layoutMarginsGuide
        
      let topMargins = self.topLayoutGuide
        
      let bottomMargins = self.bottomLayoutGuide
        
        let banner = UIView(frame: CGRect(x: 0, y: 240, width: 660, height: 42))
        self.view.addSubview(banner)
        
   
        let poplurLogo = CircleButton(frame: CGRect(x: 109, y: 82.2, width: 91.52, height: 87.8))
        let poplurChannel = CircleButton(frame: CGRect(x: 190.57, y: 72, width: 92, height: 88))
        let loginBtn = CircleButton(frame: CGRect(x: 109, y:360, width: 91.78, height: 87.68))
        let signUpBtn = CircleButton(frame: CGRect(x:190.57, y: 350.7, width:91.78, height: 87.68))
        
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
        
          //  poplurLogo = CircleButton(frame: CGRect(x: 109, y: 82.2, width: 91.52, height: 87.8))
            poplurLogo.addBorder()
            poplurLogo.animateRadius(scale: 1.5, soundOn: true)
            poplurLogo.setColorClear()
            poplurLogo.addText(string: "poplur", color: 0)
            self.view.addSubview(poplurLogo)
            
            poplurLogo.translatesAutoresizingMaskIntoConstraints = false
           
            poplurLogo.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 100).isActive = true
            poplurLogo.topAnchor.constraint(equalTo: topMargins.bottomAnchor, constant: 105).isActive = true
            poplurLogo.heightAnchor.constraint(equalTo: poplurLogo.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            poplurLogo.widthAnchor.constraint(equalTo: poplurLogo.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            
       //     poplurChannel = CircleButton(frame: CGRect(x: 190.57, y: 72, width: 92, height: 88))
            poplurChannel.addBorder()
            poplurChannel.animateRadius(scale: 1.5, soundOn: true)
            poplurChannel.setColorClear()
            poplurChannel.addText(string: "Music", color: 1)
            self.view.addSubview(poplurChannel)
            
            poplurChannel.translatesAutoresizingMaskIntoConstraints = false
            
            poplurChannel.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 182).isActive = true
            poplurChannel.topAnchor.constraint(equalTo: topMargins.bottomAnchor, constant: 82).isActive = true
            poplurChannel.heightAnchor.constraint(equalTo: poplurChannel.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            poplurChannel.widthAnchor.constraint(equalTo: poplurChannel.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true

            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            
            loginBtn.addBorder()
            loginBtn.animateRadius(scale: 1.5, soundOn: true)
            loginBtn.setColorClear()
            loginBtn.addText(string: "login", color: 0)
            loginBtn.addTarget(self, action: #selector(self.loginBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(loginBtn)
            
            loginBtn.translatesAutoresizingMaskIntoConstraints = false
            
            loginBtn.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 100).isActive = true
            loginBtn.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 68).isActive = true
            loginBtn.heightAnchor.constraint(equalTo: loginBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            loginBtn.widthAnchor.constraint(equalTo: loginBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            
            
            signUpBtn.addBorder()
            signUpBtn.animateRadius(scale: 1.5, soundOn: true)
            signUpBtn.setColorClear()
            signUpBtn.addText(string: "signup", color: 1)
            signUpBtn.addTarget(self, action: #selector(self.signUpBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(signUpBtn)
            
            signUpBtn.translatesAutoresizingMaskIntoConstraints = false
            
            signUpBtn.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 180).isActive = true
            signUpBtn.topAnchor.constraint(equalTo: banner.bottomAnchor, constant: 45).isActive = true
            signUpBtn.heightAnchor.constraint(equalTo: signUpBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            signUpBtn.widthAnchor.constraint(equalTo: signUpBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
        }
        
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        banner.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: -20).isActive = true
        banner.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 20).isActive = true
        banner.topAnchor.constraint(equalTo: poplurLogo.bottomAnchor, constant: 40).isActive = true
        banner.bottomAnchor.constraint(equalTo: loginBtn.topAnchor, constant: -40).isActive = true

        banner.backgroundColor = UIColor.black
        
        let label = UILabel()
        banner.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.centerXAnchor.constraint(equalTo: banner.centerXAnchor, constant: 0).isActive = true
        label.centerYAnchor.constraint(equalTo: banner.centerYAnchor, constant: 0).isActive = true
        
        label.textColor = UIColor.white
        label.text = "see the most poplur music near you"
        label.setSpacing(space: 2.08)
        
      
    }
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

