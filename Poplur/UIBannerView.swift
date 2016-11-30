//
//  UIBannerView.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-25.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class UIBannerView: UIView {
    
    var banner: UIView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createBannerWithText(text: String) {
        
        banner = UIView()
        banner.backgroundColor = UIColor.black
        self.addSubview(banner)

        label = UILabel()
        banner.addSubview(label)
 
        label.text = text
        label.setSpacing(space: 2.08)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: banner.leadingAnchor, constant: 31).isActive = true
        label.trailingAnchor.constraint(equalTo: banner.trailingAnchor, constant: -31).isActive = true
        label.topAnchor.constraint(equalTo: banner.topAnchor, constant: 10).isActive = true
        
        
        
    }
    
}
