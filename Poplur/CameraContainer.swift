//
//  CameraContainer.swift
//  Poplur
//
//  Created by Anthony Ma on 9/2/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import UIKit

class CameraContainer: PoplurScreen {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.name = PoplurScreenName.camera
        
        // set remote view controllers
        let leftScreen = HomeScreen()

        // set camera
        let camera = Camera()
        
        self.addChildViewController(camera)
        camera.view.frame = self.view.frame
        self.view.addSubview(camera.view)
        camera.didMove(toParentViewController: self)
        
        self.setScreenDirections(current: self, leftScreen: leftScreen, rightScreen: nil, downScreen: nil, middleScreen: nil, upScreen: nil)
        self.setRemoteEnabled(leftFunc: true, rightFunc: true, downFunc: false, middleFunc: true, upFunc: false)
        self.remote.middleBtn?.addTarget(self, action: #selector(camera.recordFunction), for: .touchUpInside)
        
        self.view.bringSubview(toFront: self.remote)
        
    }
    
    // MARK: - Right Button Function
    
    func viewTakenVideo() {
        
    }
    
    // MARK: - Left Button Function
    
    func goBack() {
        
    }
    
}
