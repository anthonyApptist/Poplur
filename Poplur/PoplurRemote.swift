//
//  PoplurRemote.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

protocol PoplurRemoteDelegate {
    
    func setRemoteDirection(up: PoplurScreen?, down: PoplurScreen?, left: PoplurScreen?, right: PoplurScreen?, middle: PoplurScreen?)
    
    func upBtnPressed(_ sender: AnyObject)
    
    func downBtnPressed(_ sender: AnyObject)
    
    func leftBtnPressed(_ sender: AnyObject)
    
    func rightBtnPressed(_ sender: AnyObject)
    
    func middleBtnPressed(_ sender: AnyObject)
    
}

class PoplurRemote: UIButton, PoplurScreenDelegate {
    
    func calculateX(x: CGFloat) -> CGFloat {
        let calc = x / screenWidth
        
        let result = screenWidth * calc
        
        return result

    }
    
    func calculateY(y: CGFloat) -> CGFloat {
        let calc = y / screenHeight
        
        let result = screenHeight * calc
        
        return result
    }
    
    var delegate: PoplurRemoteDelegate?
    
     func createLeftBtn() -> CircleButton {
        
        let leftBtn = CircleButton(frame: CGRect(x: self.calculateX(x:120), y: self.calculateY(y:546), width: self.calculateX(x:70.2), height: self.calculateY(y:67.1)))
        leftBtn.setColorBlue()
        
        let leftBtnArrow = UIImage(named: "leftarrow")
        leftBtn.setImage(leftBtnArrow, for: UIControlState.normal)
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0)
        
        leftBtn.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(leftBtn)

        return leftBtn
        
    }
    
     func createRightBtn() -> CircleButton {
        
        let rightBtn = CircleButton(frame: CGRect(x: self.calculateX(x:185.2), y: self.calculateY(y:546), width: self.calculateX(x:70.2), height: self.calculateY(y:67.1)))
        rightBtn.setColorRed()
        
        let rightBtnArrow = UIImage(named: "rightarrow")
        rightBtn.setImage(rightBtnArrow, for: UIControlState.normal)
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0)
        
        rightBtn.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(rightBtn)
        
        return rightBtn
        
    }
    
     func createUpBtn() -> CircleButton {
        
        let upBtn = CircleButton(frame: CGRect(x: self.calculateX(x:153.5), y: self.calculateY(y:511.5), width: self.calculateX(x: 70.2), height: self.calculateY(y:67.1)))
        upBtn.setColorGreen()
        
        let upBtnArrow = UIImage(named: "uparrow")
        upBtn.setImage(upBtnArrow, for: UIControlState.normal)
        upBtn.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0)
        
        upBtn.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(upBtn)
        
        return upBtn
    }
    
     func createDownBtn() -> CircleButton {

        let downBtn = CircleButton(frame: CGRect(x: self.calculateX(x:153.5), y: self.calculateY(y: 576), width: self.calculateX(x: 70.2), height: self.calculateY(y: 67.1)))
        downBtn.setColorOrange()
        
        let downBtnArrow = UIImage(named: "downarrow")
        downBtn.setImage(downBtnArrow, for: UIControlState.normal)
        downBtn.imageEdgeInsets = UIEdgeInsetsMake(30, 0, 0, 0)
        
        downBtn.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(downBtn)
        
        return downBtn
    }
    
     func createMiddleBtn() -> CircleButton {
        
        let middleBtn = CircleButton(frame: CGRect(x: self.calculateX(x: 153), y: self.calculateY(y:545), width: self.calculateX(x:70.2), height: self.calculateY(y:67.1)))
        middleBtn.setColorClear()
        
        let middleBtnArrow = UIImage(named: "combinedShape")
        middleBtn.setImage(middleBtnArrow, for: UIControlState.normal)
        
        middleBtn.animateRadius(scale: 1.2, soundOn: false)
        self.addSubview(middleBtn)
        
        return middleBtn
    }
   
    
    required override init(frame: CGRect) {
        
        super.init(frame: frame)
        
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
