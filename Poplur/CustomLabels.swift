//
//  CustomLabels.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

extension UILabel {
    func setSpacing(space: CGFloat) {
        
        let attributedString = NSMutableAttributedString(string: (self.text!))
        attributedString.addAttribute(NSKernAttributeName, value: space, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
        
    }
}

extension UITextField {
    func addBorder() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.4
    }
}
