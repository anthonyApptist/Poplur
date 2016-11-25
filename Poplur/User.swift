//
//  User.swift
//  PoplurDemo
//
//  Created by Anthony Ma on 29/9/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit

struct User {
    
    private var _uid: String
    private var _email: String
    
    var uid: String {
        return _uid
    }
    
    var email: String {
        return _email
    }
    
    init(uid: String, email: String) {
        _uid = uid
        _email = email
    }
}
