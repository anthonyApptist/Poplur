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
    
    var margins : UILayoutGuide!
   
    var backgroundImage = UIImage()
    
    var remote: PoplurRemote!
    
    var backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
    
    var banner: UIBannerView?
    
    var name = PoplurScreenName.none
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        margins = self.view.layoutMarginsGuide
        
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
        self.view.addSubview(remote)

    }
    
    
    func setScreenDirections(current: PoplurScreen?, left: PoplurScreen?, right: PoplurScreen?, down: PoplurScreen?, middle: PoplurScreen?){
        
        self.leftVC = left
        self.rightVC = right
        self.downVC = down
        self.middleVC = middle
        
        
    }
    

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}
