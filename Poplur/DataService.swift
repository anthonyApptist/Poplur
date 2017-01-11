//
//  DataService.swift
//  PoplurDemo
//
//  Created by Anthony Ma on 4/11/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage


class DataService {
    private static let _instance = DataService()
    
    static var instance: DataService {
        return _instance
    }
    
    //MARK: Database
    
    var mainRef: FIRDatabaseReference {
        return FIRDatabase.database().reference()
    }
    
    var usersRef: FIRDatabaseReference {
        return mainRef.child("users")
    }
    
    var usersMusicRef: FIRDatabaseReference {
        return mainRef.child("users").child("music")
    }
    
    var musicVideosRef: FIRDatabaseReference {
        return mainRef.child("musicVideos")
    }
    
    func saveMusicRegisterUser(uid: String, email: String, name: String) {
        let profile: Dictionary<String, AnyObject> = ["email": email as AnyObject, "name": name as AnyObject, "likes": 0 as AnyObject]
        musicVideosRef.child(uid).setValue(profile)
    }
    
    // MARK: Storage
    
    var mainStorageRef: FIRStorageReference {
        return FIRStorage.storage().reference(forURL: "gs://poplurdemo.appspot.com")
    }
    
    var artistVideosStorageRef: FIRStorageReference {
        return mainStorageRef.child("ArtistVideos")
    }
    
    func saveNewMusicVideo(videoID: String, downloadURL: URL, userUID: String) {
        let videoInfo: Dictionary<String, AnyObject> = ["reference": downloadURL as AnyObject, "likes": 0 as AnyObject, "posted by": userUID as AnyObject, "flagged": 0 as AnyObject]
        musicVideosRef.child(videoID).setValue(videoInfo)
    }
    
}
