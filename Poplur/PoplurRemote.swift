//
//  PoplurRemote.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

let remoteStates = ["Up", "Down", "Left", "Right", "Middle"]
var currentState: String = ""

let myNotification = Notification.Name("Notification")

class PoplurRemote: UIView {
    
    var upBtn: CircleButton?
    var downBtn: CircleButton?
    var leftBtn: CircleButton?
    var rightBtn: CircleButton?
    var middleBtn: CircleButton?
    
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
    
 
    
     func createLeftBtn() {
        
        leftBtn = CircleButton(frame: CGRect(x: 120, y: 546, width: 70.2, height: 67.1))
        leftBtn?.isUserInteractionEnabled = true
        leftBtn?.setColorBlue()
        
        let leftBtnArrow = UIImage(named: "leftarrow")
        leftBtn?.setImage(leftBtnArrow, for: UIControlState.normal)
        leftBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0)
        
        leftBtn?.addTarget(self, action: #selector(self.leftBtnPressed(_:)), for: .touchUpInside)
        
        leftBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(leftBtn!)

        
    }
    
     func createRightBtn() {
        
        rightBtn = CircleButton(frame: CGRect(x: 185.2, y: 546, width: 70.2, height: 67.1))
        rightBtn?.isUserInteractionEnabled = true
        rightBtn?.setColorRed()
        
        let rightBtnArrow = UIImage(named: "rightarrow")
        rightBtn?.setImage(rightBtnArrow, for: UIControlState.normal)
        rightBtn?.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0)
        
        rightBtn?.addTarget(self, action: #selector(self.rightBtnPressed(_:)), for: .touchUpInside)
        
        rightBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(rightBtn!)
        
    }
    
     func createUpBtn() {
        
        upBtn = CircleButton(frame: CGRect(x: 153.5, y: 511.5, width: 70.2, height: 67.1))
        upBtn?.isUserInteractionEnabled = true
        upBtn?.setColorGreen()
        
        let upBtnArrow = UIImage(named: "uparrow")
        upBtn?.setImage(upBtnArrow, for: UIControlState.normal)
        upBtn?.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0)
        
        upBtn?.addTarget(self, action: #selector(self.upBtnPressed(_:)), for: .touchUpInside)
        
        upBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(upBtn!)
    }
    
     func createDownBtn() {

        downBtn = CircleButton(frame: CGRect(x: 153.5, y: 576, width: 70.2, height: 67.1))
        downBtn?.isUserInteractionEnabled = true
        downBtn?.setColorOrange()
        
        let downBtnArrow = UIImage(named: "downarrow")
        downBtn?.setImage(downBtnArrow, for: UIControlState.normal)
        downBtn?.imageEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0)
        
        downBtn?.addTarget(self, action: #selector(self.downBtnPressed(_:)), for: .touchUpInside)
        
        downBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(downBtn!)
    }
    
     func createMiddleBtn() {
        
        middleBtn = CircleButton(frame: CGRect(x: 153, y: 545, width: 70.2, height: 67.1))
        middleBtn?.isUserInteractionEnabled = true
        middleBtn?.setColorClear()
        
        let middleBtnArrow = UIImage(named: "combinedShape")
        middleBtn?.setImage(middleBtnArrow, for: UIControlState.normal)
        
        middleBtn?.addTarget(self, action: #selector(self.middleBtnPressed(_:)), for: .touchUpInside)
        
        middleBtn?.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(middleBtn!)
    }
   
    
    required override init(frame: CGRect) {
        
        super.init(frame: frame)
        
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
