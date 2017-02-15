//
//  UIBannerView.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-25.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class UIBannerView: UIView {
    
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.frame = CGRect(x: 0, y: 240, width: UIScreen.main.bounds.width, height: 42)
        
    }
    
    func initWithOffsetY(frame: CGRect, offsetY: CGFloat) {
        self.frame = CGRect(x: 0, y: 240 + offsetY, width: UIScreen.main.bounds.width, height: 42)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createBannerWithText(text: String) {
        
        self.backgroundColor = UIColor.black

        label = UILabel()
        self.addSubview(label)
 
        label.text = text
        label.setSpacing(space: 2.08)
        
        label.translatesAutoresizingMaskIntoConstraints = false
     
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: -10).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        
        label.pinToLeft(view: self, margin: 10).isActive = true
        label.pinToRight(view: self, margin: -10).isActive = true
        
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.6
        
        label.textColor = UIColor.white
        
        
    }
    
}
