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

protocol PoplurScreenDelegate {
    
    func calculateX(x: CGFloat) -> CGFloat
    func calculateY(y: CGFloat) -> CGFloat
}


class PoplurScreen: UIViewController, PoplurRemoteDelegate, UITextFieldDelegate {
    
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
   
    var backgroundImageView = UIImageView()
    var backgroundImage = UIImage()
    
    var remote: PoplurRemote!
    
    var upScreen: PoplurScreen!
    var downScreen: PoplurScreen!
    var leftScreen: PoplurScreen!
    var rightScreen: PoplurScreen!
    var middleScreen: PoplurScreen!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        remote = PoplurRemote(frame: CGRect(x: 0, y: 0, width: calculateX(x:127), height: calculateY(y:122)))
        
        var delegate: PoplurScreenDelegate?
        
        self.view.addSubview(backgroundImageView)

        self.view.addSubview(remote)
                
        backgroundImageView.contentMode = .scaleAspectFill
    
    }
    
    @IBAction func upBtnPressed(_ sender: AnyObject) {
        present(upScreen, animated: false, completion: nil)
    }
    
    @IBAction func downBtnPressed(_ sender: AnyObject) {
        present(downScreen, animated: false, completion: nil)
    }
    
    @IBAction func leftBtnPressed(_ sender: AnyObject) {
        present(leftScreen, animated: false, completion: nil)
    }
    
    @IBAction func rightBtnPressed(_ sender: AnyObject) {
        present(rightScreen, animated: false, completion: nil)
    }
    
    @IBAction func middleBtnPressed(_ sender: AnyObject) {
        present(middleScreen, animated: false, completion: nil)
    }

    
    func setRemoteDirection(up: PoplurScreen?, down: PoplurScreen?, left: PoplurScreen?, right: PoplurScreen?, middle: PoplurScreen?) {
        
        upScreen = up
        downScreen = down
        leftScreen = left
        rightScreen = right
        middleScreen = middle

        remote.createUpBtn().addTarget(self, action: #selector(self.upBtnPressed(_:)), for: .touchUpInside)
        remote.createDownBtn().addTarget(self, action: #selector(self.downBtnPressed(_:)), for: .touchUpInside)
        remote.createLeftBtn().addTarget(self, action: #selector(self.leftBtnPressed(_:)), for: .touchUpInside)
        remote.createRightBtn().addTarget(self, action: #selector(self.rightBtnPressed(_:)), for: .touchUpInside)
        remote.createMiddleBtn().addTarget(self, action: #selector(self.middleBtnPressed(_:)), for: .touchUpInside)
        
    }
    
   
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
