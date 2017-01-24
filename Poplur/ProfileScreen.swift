//
//  ProfileScreen.swift
//  Poplur
//
//  Created by Mark Meritt on 2017-01-13.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class ProfileScreen: PoplurScreen {
    
    @IBAction func uploadBtnPressed(_ sender: AnyObject) {
        
      //  present(LogInScreen(), animated: false, completion: nil)
    }
    
    @IBAction func likesBtnPressed(_ sender: AnyObject) {
        
    //    present(SignUpScreen(), animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.name = PoplurScreenName.profile
        self.setScreenDirections(current: self, leftScreen: nil, rightScreen: nil, downScreen: nil, middleScreen: nil, upScreen: nil)
        self.setRemoteEnabled(leftFunc: true, rightFunc: true, downFunc: true, middleFunc: true, upFunc: true)
        self.remote.middleBtn?.animateWithNewImage(scale: 1.2, soundOn: false, image: self.remote.middleBtnArrow!)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        let mailButton = UIButton(frame: CGRect(x: 18.4, y: 61.9, width: 37.4, height: 28.1))
        mailButton.setImage(UIImage(named: "mailIcon"), for: .normal)
        self.view.addSubview(mailButton)
        
        mailButton.translatesAutoresizingMaskIntoConstraints = false
        mailButton.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 18.4).isActive = true
        mailButton.topAnchor.constraint(equalTo: self.margins.topAnchor, constant: 61.9).isActive = true
        mailButton.heightAnchor.constraint(equalTo: mailButton.heightAnchor, multiplier: 0.05, constant: 28.1).isActive = true
        mailButton.widthAnchor.constraint(equalTo: mailButton.widthAnchor, multiplier: 0.05, constant: 37.4).isActive = true
        
        let redButton = UIButton(frame: CGRect(x: 64.3, y: 63.7, width: 23, height: 23))
        redButton.setImage(UIImage(named: "circleIcon"), for: .normal)
        self.view.addSubview(redButton)
        
        redButton.translatesAutoresizingMaskIntoConstraints = false
        redButton.leadingAnchor.constraint(equalTo: mailButton.trailingAnchor, constant: 8.5).isActive = true
        redButton.topAnchor.constraint(equalTo: self.margins.topAnchor, constant: 63.7).isActive = true
        redButton.heightAnchor.constraint(equalTo: redButton.heightAnchor, multiplier: 0.05, constant: 23).isActive = true
        redButton.widthAnchor.constraint(equalTo: redButton.widthAnchor, multiplier: 0.05, constant: 23).isActive = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            
            let poplurLogo = CircleButton(frame: CGRect(x: 109, y: 82, width: 92, height: 88))
            poplurLogo.addBorder()
            poplurLogo.animateRadius(scale: 1.5, soundOn: true)
            poplurLogo.setColourWhite()
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
            poplurChannel.setColourWhite()
            poplurChannel.addText(string: "Music", color: 1)
            self.view.addSubview(poplurChannel)
            
            poplurChannel.translatesAutoresizingMaskIntoConstraints = false
            
            poplurChannel.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 167).isActive = true
            poplurChannel.bottomAnchor.constraint(equalTo: (self.banner?.topAnchor)!, constant: -68).isActive = true
            poplurChannel.heightAnchor.constraint(equalTo: poplurChannel.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            poplurChannel.widthAnchor.constraint(equalTo: poplurChannel.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            
            let uploadBtn = CircleButton(frame: CGRect(x: 109, y:360, width: 92, height: 88))
            uploadBtn.addBorder()
            uploadBtn.animateRadius(scale: 1.5, soundOn: true)
            uploadBtn.setColourWhite()
            uploadBtn.addText(string: "uploads", color: 0)
            uploadBtn.addTarget(self, action: #selector(self.uploadBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(uploadBtn)
            
            uploadBtn.translatesAutoresizingMaskIntoConstraints = false
            
            uploadBtn.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 80).isActive = true
            uploadBtn.topAnchor.constraint(equalTo: (self.banner?.bottomAnchor)!, constant: 68).isActive = true
            uploadBtn.heightAnchor.constraint(equalTo: uploadBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            uploadBtn.widthAnchor.constraint(equalTo: uploadBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
            
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            
            let likesBtn = CircleButton(frame: CGRect(x:190.57, y: 350.7, width:92, height: 88))
            likesBtn.addBorder()
            likesBtn.animateRadius(scale: 1.5, soundOn: true)
            likesBtn.setColourWhite()
            likesBtn.addText(string: "likes", color: 1)
            likesBtn.addTarget(self, action: #selector(self.likesBtnPressed(_:)), for: .touchUpInside)
            self.view.addSubview(likesBtn)
            
            likesBtn.translatesAutoresizingMaskIntoConstraints = false
            
            likesBtn.leadingAnchor.constraint(equalTo: self.margins.leadingAnchor, constant: 167).isActive = true
            likesBtn.topAnchor.constraint(equalTo: (self.banner?.bottomAnchor)!, constant: 45).isActive = true
            likesBtn.heightAnchor.constraint(equalTo: likesBtn.heightAnchor, multiplier: 0.05, constant: 87.8).isActive = true
            likesBtn.widthAnchor.constraint(equalTo: likesBtn.widthAnchor, multiplier: 0.05, constant: 91.52).isActive = true
        }
        
        
        
        banner?.createBannerWithText(text: self.userName!)
        
    }
    
}

