//
//  PoplurRemote.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

let remoteStates = ["Up", "Down", "Left", "Right", "Middle", "LogIn", "SignUp"]
var currentState: String = ""

let myNotification = Notification.Name("Notification")

class PoplurRemote: UIView {
    
    var upBtn: CircleButton?
    var downBtn: CircleButton?
    var leftBtn: CircleButton?
    var rightBtn: CircleButton?
    var middleBtn: CircleButton?
    
    let middleBtnArrow = UIImage(named: "combinedShape")
    
    func upBtnPressed(_ sender: AnyObject) {
        currentState = remoteStates[0]
        print("remote state is: " + currentState)
        NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])
    }
    
    func downBtnPressed(_ sender: AnyObject) {
        currentState = remoteStates[1]
        print("remote state is: " + currentState)
        NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])
    }
    
    func leftBtnPressed(_ sender: AnyObject) {
        currentState = remoteStates[2]
        print("remote state is: " + currentState)
        NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])

    }
    
    func rightBtnPressed(_ sender: AnyObject) {
        currentState = remoteStates[3]
        print("remote state is: " + currentState)
        NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])
    }
    
    func middleBtnPressed(_ sender: AnyObject) {
        currentState = remoteStates[4]
        print("remote state is: " + currentState)
        NotificationCenter.default.post(name: myNotification, object: nil, userInfo: ["message": currentState])
    }
    
    
    func createLeftBtn() -> CircleButton {
        
        leftBtn = CircleButton(frame: CGRect(x: 120, y: 546, width: 70.2, height: 67.1))
        leftBtn?.setColorBlue()
        
        let leftBtnArrow = UIImage(named: "leftarrow")
        leftBtn?.setImage(leftBtnArrow, for: UIControlState.normal)
        leftBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0)
        
       
        leftBtn?.turnOff()
     
              leftBtn?.isUserInteractionEnabled = true 
              leftBtn?.addTarget(self, action: #selector(self.leftBtnPressed(_:)), for: .touchUpInside)
        
        leftBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(leftBtn!)
        
        return leftBtn!
        
    }
    
    func createRightBtn() -> CircleButton {
        
        rightBtn = CircleButton(frame: CGRect(x: 185.2, y: 546, width: 70.2, height: 67.1))
        rightBtn?.setColorRed()
        
        let rightBtnArrow = UIImage(named: "rightarrow")
        rightBtn?.setImage(rightBtnArrow, for: UIControlState.normal)
        rightBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0)
        
       
        rightBtn?.turnOff()
     
            rightBtn?.isUserInteractionEnabled = true
            rightBtn?.addTarget(self, action: #selector(self.rightBtnPressed(_:)), for: .touchUpInside)
 
        
        rightBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(rightBtn!)
        
        return rightBtn!
        
    }
    
    func createUpBtn() -> CircleButton {
        
        upBtn = CircleButton(frame: CGRect(x: 153.5, y: 511.5, width: 70.2, height: 67.1))
        upBtn?.setColorGreen()
        
        let upBtnArrow = UIImage(named: "uparrow")
        upBtn?.setImage(upBtnArrow, for: UIControlState.normal)
        upBtn?.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0)
        

        upBtn?.turnOff()
   
            upBtn?.isUserInteractionEnabled = true
            upBtn?.addTarget(self, action: #selector(self.upBtnPressed(_:)), for: .touchUpInside)
        
        upBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(upBtn!)
        
        return upBtn!
    }
    
    func createDownBtn() -> CircleButton {

        downBtn = CircleButton(frame: CGRect(x: 153.5, y: 576, width: 70.2, height: 67.1))
        downBtn?.setColorOrange()
        
        let downBtnArrow = UIImage(named: "downarrow")
        downBtn?.setImage(downBtnArrow, for: UIControlState.normal)
        downBtn?.imageEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0)
        
        downBtn?.turnOff()
      
        downBtn?.isUserInteractionEnabled = true
        downBtn?.addTarget(self, action: #selector(self.downBtnPressed(_:)), for: .touchUpInside)

        
        downBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(downBtn!)
        
        return downBtn!
    }
    
    func createMiddleBtn() -> CircleButton {
        
        middleBtn = CircleButton(frame: CGRect(x: 153, y: 545, width: 70.2, height: 67.1))
        middleBtn?.setColorClear()
        
        middleBtn?.turnOff()
    
        middleBtn?.isUserInteractionEnabled = true
        middleBtn?.addTarget(self, action: #selector(self.middleBtnPressed(_:)), for: .touchUpInside)
   
        
        self.addSubview(middleBtn!)
        
        return middleBtn!
    }
   
    
    required override init(frame: CGRect) {
        
        super.init(frame: frame)
        
    }
    
    func createButtons() {
        
        self.clipsToBounds = true
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            self.createLeftBtn()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.4) {
            self.createRightBtn()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.6) {
            self.createUpBtn()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8) {
            self.createDownBtn()
        }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            self.createMiddleBtn()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
}
