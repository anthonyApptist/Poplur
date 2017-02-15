//
//  Camera.swift
//  Poplur
//
//  Created by Anthony Ma on 10/1/2017.
//  Copyright © 2017 Anthony Ma. All rights reserved.
//

import UIKit
import AVFoundation

protocol VideoUploadDelegate {
    func videoPosted()
    func recordingStopped(video: URL)
    func recordingStarted()
    func shouldEnableUI()
}

class Camera: PoplurCameraVC {

    var _previewView = PreviewView()
    
    override func viewDidLoad() {
        previewView = _previewView
        
        previewView.frame = UIScreen.main.bounds
        
        videoDelegate = self
        
        super.viewDidLoad()
        
        self.view.addSubview(previewView)
        
    }
    
    override func viewWillLayoutSubviews() {
        
    }
    
    // push button to record
    func recordFunction() {
        self.toggleMovieRecording()
    }

}

extension Camera: VideoUploadDelegate {
    internal func recordingStarted() {
        
    }

    internal func recordingStopped(video: URL) {
        
    }
    
    internal func videoPosted() {
        
    }

    internal func shouldEnableUI() {
        
    }
    
}

