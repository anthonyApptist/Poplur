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

extension UIView {
    
    func pinToTop(view: UIView, margin: CGFloat) -> NSLayoutConstraint {
        let topViewConstraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .topMargin, multiplier: 1, constant: margin)
        
        return topViewConstraint
    }
    
    func pinToLeft(view: UIView, margin: CGFloat) -> NSLayoutConstraint {
        let leftViewConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1, constant: margin)
        
        return leftViewConstraint
    }
    
    func pinToRight(view: UIView, margin: CGFloat) -> NSLayoutConstraint {
        let rightViewConstraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1, constant: margin)
        
        return rightViewConstraint
    }
    
    func pinToBottom(view: UIView, margin: CGFloat) -> NSLayoutConstraint {
        let bottomViewConstraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottomMargin, multiplier: 1.0, constant: margin)
        
        return bottomViewConstraint
    }
}
