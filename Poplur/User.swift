//
//  User.swift
//  Poplur
//
//  Created by Anthony Ma on 29/9/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var uid: String
    var email: String
    var name: String
    var city: String
    
    init(uid: String, email: String, name: String, city: String) {
        self.uid = uid
        self.email = email
        self.name = name
        self.city = city
    }
}
