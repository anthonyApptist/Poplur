//
//  AssetUploadingDelegate.swift
//  PoplurDemo
//
//  Created by Anthony Ma on 31/10/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit

protocol AssetUploadingDelegate: class {
    
    func videoRecordingComplete(videoURL: NSURL)
    
    func videoRecordingFailed()
    
}
