//
//  PoplurScreen.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height

enum PoplurScreenName {
    case none
    case home
    case profile
    case discover
    case ranked
    case logIn
    case signUp
    case camera
    case messageHome
    case messageDetail
}

class PoplurScreen: UIViewController, UITextFieldDelegate {
    
    var leftVC: PoplurScreen?
    var rightVC: PoplurScreen?
    var downVC: PoplurScreen?
    var middleVC: PoplurScreen?
    var upVC: PoplurScreen?
    var logInVC: PoplurScreen?
    var signUpVC: PoplurScreen?
    
    var margins : UILayoutGuide!
   
    var backgroundImage = UIImage()
    
    var remote: PoplurRemote!
    
    var backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    
    var banner: UIBannerView?
    
    var name = PoplurScreenName.none
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
  
    var userName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        margins = self.view.layoutMarginsGuide
        
        userName = app.userDefaults.string(forKey: "userName")
     
        remote = PoplurRemote(frame: CGRect(x: 0, y: 0, width: 1527, height: 1522))
        
        remote.isUserInteractionEnabled = true
        
        if name != PoplurScreenName.camera {
        self.view.addSubview(backgroundImageView)
        
        self.banner = UIBannerView()
        self.view.addSubview(banner!)
        
            
        backgroundImage = UIImage(named: "bitmap")!
        backgroundImageView.image = backgroundImage
        backgroundImageView.alpha = 0.9
        backgroundImageView.contentMode = .scaleAspectFill
        
        backgroundImageView.pinToTop(view: self.view, margin: 0).isActive = true
        backgroundImageView.pinToLeft(view: self.view, margin: 0).isActive = true
        backgroundImageView.pinToRight(view: self.view, margin: 0).isActive = true
        backgroundImageView.pinToBottom(view: self.view, margin: 0).isActive = true
    
        banner?.pinToLeft(view: self.view, margin: 0).isActive = true
        banner?.pinToRight(view: self.view, margin: 0).isActive = true
        banner?.pinToBottom(view: self.view, margin: -395).isActive = true
        banner?.pinToTop(view: self.view, margin: 225).isActive = true
        }
        
        remote.createButtons()
        self.view.addSubview(remote)

    }
    

    func setRemoteEnabled(leftFunc: Bool, rightFunc: Bool, downFunc: Bool, middleFunc: Bool, upFunc: Bool) {
        
        if(leftFunc) {
            
        remote.createLeftBtn().turnOn()
       
        } else {
            
            remote.createLeftBtn().turnOff()
            
        }
        
        if(rightFunc) {
            
            remote.createRightBtn().turnOn()
            
        } else {
            
            remote.createRightBtn().turnOff()
            
        }
        
        if(downFunc) {
            
            remote.createDownBtn().turnOn()
            
        } else {
            
            remote.createDownBtn().turnOff()
            
        }
        
        if(upFunc) {
            
            remote.createUpBtn().turnOn()
            
        } else {
            
            remote.createUpBtn().turnOff()
            
        }
        
        if(middleFunc) {
            
            remote.createMiddleBtn().turnOn()
            
        } else {
            
            remote.createMiddleBtn().turnOff()
            
        }
       
     
        
         }
    
 
    
    func setScreenDirections(current: PoplurScreen?, leftScreen: PoplurScreen?, rightScreen: PoplurScreen?, downScreen: PoplurScreen?, middleScreen: PoplurScreen?, upScreen: PoplurScreen?){

        
        if leftScreen != nil {
            
            if(self.leftVC == nil) {
                self.leftVC = leftScreen
            }
            
        }
      
        if rightScreen != nil {
            
            if(self.rightVC == nil) {
            self.rightVC = rightScreen
            }
            
        }
        
        if downScreen != nil {
            
            if(self.downVC == nil) {
            self.downVC = downScreen
            }
            
        }
        
        if middleScreen != nil {
         
            if(self.middleVC == nil) {
            self.middleVC = middleScreen
            }
        }
        
        if upScreen != nil {
            
            if(self.upVC == nil) {
            self.upVC = upScreen
            }
        }
        
     
        
     
            
        
        if(self.logInVC == nil) {
            
            self.logInVC = LogInScreen()
        }
        
        if(self.signUpVC == nil){
        self.signUpVC = SignUpScreen()
        }

        
  

        
        
    }
        

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
