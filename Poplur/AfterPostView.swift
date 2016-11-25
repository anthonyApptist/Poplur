//
//  AfterPostView.swift
//  PoplurDemo
//
//  Created by Anthony Ma on 5/11/2016.
//  Copyright © 2016 Anthony Ma. All rights reserved.
//

import UIKit
import AVFoundation

class AfterPostView: UIViewController {
    
    var videoPlayer: AVPlayer?
    
    var videoLayer: AVPlayerLayer!
    
    var downloadedURL: URL!
    
    var leftButton: UIButton!
    
    var centerButton: UIButton!
    
    var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // screen size
        let centerOfFrameX = view.center.x
        
        let bottomOfFrame = view.frame.maxY
        
        let leftImage = UIImage.init(named: "left")
        
        let centerImage = UIImage.init(named: "upvote")
        
        let rightImage = UIImage.init(named: "right")
        
        // left button
        leftButton = UIButton.init(frame: CGRect.zero)
        leftButton.setImage(leftImage, for: .normal)
        leftButton.frame = CGRect(x: 0, y: 0, width: leftImage!.size.width, height: leftImage!.size.height)
        leftButton.frame.origin = CGPoint.init(x: centerOfFrameX - centerImage!.size.width/2 - leftImage!.size.width - 30, y: bottomOfFrame - leftImage!.size.height - 20)
        leftButton.addTarget(self, action: #selector(leftButtonFunction), for: .touchUpInside)
        
        let longPressGesture = UILongPressGestureRecognizer.init(target: self, action: #selector(longPressGestureFunction))
        longPressGesture.minimumPressDuration = 2
        
        leftButton.addGestureRecognizer(longPressGesture)
        
        
        
        // center button
        centerButton = UIButton.init(frame: CGRect.zero)
        centerButton.setImage(centerImage, for: .normal)
        centerButton.frame = CGRect(x: 0, y: 0, width: centerImage!.size.width, height: centerImage!.size.height)
        centerButton.frame.origin = CGPoint.init(x: view.center.x - centerImage!.size.width / 2, y: bottomOfFrame - centerImage!.size.height - 30)
        centerButton.addTarget(self, action: #selector(centerButtonFunction), for: .touchUpInside)
        
        
        // right button
        rightButton = UIButton.init(frame: CGRect.zero)
        rightButton.setImage(rightImage, for: .normal)
        rightButton.frame = CGRect(x: 0, y: 0, width: rightImage!.size.width, height: rightImage!.size.height)
        rightButton.frame.origin = CGPoint.init(x: centerOfFrameX + centerImage!.size.width/2 + 30, y: bottomOfFrame - rightImage!.size.height - 20)
        rightButton.addTarget(self, action: #selector(rightButtonFunction), for: .touchUpInside)
        
        videoLayer = AVPlayerLayer()
        
        videoLayer.frame = view.frame
        
        view.layer.addSublayer(videoLayer)
        
        view.addSubview(leftButton)
        
        view.addSubview(centerButton)
        
        view.addSubview(rightButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        videoPlayer = AVPlayer.init(url: downloadedURL)
    
        videoLayer.player = videoPlayer
        
        videoPlayer?.play() 
        
    }
    
    func longPressGestureFunction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func leftButtonFunction() {
        
    }
    
    func centerButtonFunction() {
        
    }
    
    func rightButtonFunction() {
        
    }

}
