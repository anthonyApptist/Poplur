//
//  LabelCustomSpacing.swift
//  Poplur
//
//  Created by Mark Meritt on 2017-01-22.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

class LabelCustomSpacing: UILabel {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var space: CGFloat = 1.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.setSpacing(space: space)
        
    }
    
}

