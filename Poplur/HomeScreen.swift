//
//  ViewController.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-12.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class HomeScreen: PoplurScreen {
    
    var label: UILabel!
    
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
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
      
        // Do any additional setup after loading the view, typically from a nib.
        let banner = UIView(frame: CGRect(x: 0, y: calculateY(y: 240), width: calculateX(x: 375), height: calculateY(y: 42)))
        banner.backgroundColor = UIColor.black
        self.view.addSubview(banner)
        
        label.frame = CGRect(x: calculateX(x:31), y: calculateY(y:250.2), width: calculateX(x:313), height: calculateY(y:21))
        label.text = "see the most poplur music near you"
        label.setSpacing(space: 2.08)
        self.view.addSubview(label)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {

        
        let poplurLogo = CircleButton(frame: CGRect(x: self.calculateX(x:109), y: self.calculateY(y:82.2), width: self.calculateX(x:91.52), height: self.calculateY(y:87.8)))
        poplurLogo.addBorder()
        poplurLogo.animateRadius(scale: 1.5, soundOn: true)
        poplurLogo.setColorClear()
        poplurLogo.addText(string: "poplur", color: 0)
        self.view.addSubview(poplurLogo)
                        
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
        
        let poplurChannel = CircleButton(frame: CGRect(x: self.calculateX(x:190.57), y: self.calculateY(y:72), width: self.calculateX(x: 92), height: self.calculateY(y: 88)))
        poplurChannel.addBorder()
        poplurChannel.animateRadius(scale: 1.5, soundOn: true)
        poplurChannel.setColorClear()
        poplurChannel.addText(string: "Music", color: 1)
        self.view.addSubview(poplurChannel)
        
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            
            let loginBtn = CircleButton(frame: CGRect(x: self.calculateX(x:109), y: self.calculateY(y:360), width: self.calculateX(x:91.78), height: self.calculateY(y:87.68)))
            loginBtn.addBorder()
            loginBtn.animateRadius(scale: 1.5, soundOn: true)
            loginBtn.setColorClear()
            loginBtn.addText(string: "login", color: 0)
            loginBtn.addTarget(self, action: #selector(self.loginBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(loginBtn)
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            
        
            let signUpBtn = CircleButton(frame: CGRect(x: self.calculateX(x:190.57), y: self.calculateY(y:350.7), width: self.calculateX(x:91.78), height: self.calculateY(y:87.68)))
            signUpBtn.addBorder()
            signUpBtn.animateRadius(scale: 1.5, soundOn: true)
            signUpBtn.setColorClear()
            signUpBtn.addText(string: "signup", color: 1)
            signUpBtn.addTarget(self, action: #selector(self.signUpBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(signUpBtn)

            
        }

        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}

