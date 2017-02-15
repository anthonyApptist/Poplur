//
//  Video.swift
//  Poplur
//
//  Created by Anthony Ma on 3/2/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation

class Video: NSObject {
    
    enum Category: String {
        case music = "music"
        case lifestyle = "lifestyle"
    }
    
    // Properties
    var category: Category
    var likes: Int
    var locationPosted: String
    var postedBy: String
    var url: URL
    var watchedBy: NSArray?
    var watchedFrom: NSArray?
    
    
    
    init(category: Category, likes: Int, locationPosted: String, postedBy: String, url: URL) {
        self.category = category
        self.likes = likes
        self.locationPosted = locationPosted
        self.postedBy = postedBy
        self.url = url
    }
    
    // return postedBy and location
    
    
    
}
