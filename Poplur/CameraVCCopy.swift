//
//  CameraVCCopy.swift
//  Poplur
//
//  Created by Anthony Ma on 24/11/2016.
//  Copyright © 2016 Apptist. All rights reserved.
//


import UIKit
import AVFoundation
import FirebaseStorage
import FirebaseDatabase
import FirebaseAuth
import Photos

class CameraVCCopy: UIViewController {
    
    enum SessionSetupResult {
        case success
        case notAuthorized
        case configurationFailed
    }
    
    var movieFileOutput: AVCaptureMovieFileOutput? = nil
    
    var previewView = PreviewView()
    
    let session = AVCaptureSession()
    
    var isSessionRunning = false
    
    let sessionQueue = DispatchQueue(label: "session queue", attributes: [], target: nil)
    
    var setupResult: SessionSetupResult = .success
    
    var changeCameraButton: UIButton!
    
    var viewRecordButton: UIButton!
    
    var segmentedControl: UISegmentedControl!
    
    var _videoURL: URL?
    
    var postButton: UIButton!
    
    var videoDeviceInput: AVCaptureDeviceInput!
    
    weak var delegate: AssetUploadingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cameraAuthorization()
        
        videoOutputSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        changeCameraButton = UIButton.init(frame: CGRect(x: 15, y: 15, width: 100, height: 100))
        
        changeCameraButton.setTitle("Camera", for: .normal)
        
        changeCameraButton.setTitleColor(UIColor.white, for: .normal)
        
        changeCameraButton.isUserInteractionEnabled = true
        
        //        changeCameraButton.addTarget(self, action: #selector(toggleCameraFunction(_:)), for: .touchUpInside)
        
        
        
        viewRecordButton = UIButton.init(frame: CGRect(x: 15, y: 500, width: 100, height: 100))
        
        viewRecordButton.setTitle("Record", for: .normal)
        
        viewRecordButton.setTitleColor(UIColor.white, for: .normal)
        
        viewRecordButton.isUserInteractionEnabled = true
        
        //        viewRecordButton.addTarget(self, action: #selector(recordButtonFunction(_:)), for: .touchUpInside)
        
        segmentedControl = UISegmentedControl.init(items: ["Photo", "Movie"])
        
        segmentedControl.frame = CGRect(x: 0, y: 0, width: 100, height: 30)
        
        segmentedControl.frame.origin.x = self.view.center.x
        
        segmentedControl.frame.origin.y = self.view.center.y + 150
        
        //        segmentedControl.addTarget(self, action: #selector(changeMode(_:)), for: .valueChanged)
        
        
        postButton = UIButton.init(frame: CGRect.zero)
        postButton.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        postButton.setTitle("Post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.isUserInteractionEnabled = false
        postButton.addTarget(self, action: #selector(postButtonFunction(_:)), for: .touchUpInside)
        
        
        
        previewView.frame = UIScreen.main.bounds
        
        previewView.session = session
        
        //        captureModeControl = segmentedControl
        
        //        recordButton = viewRecordButton
        
        //        super.viewDidLoad()
        
        
        view.addSubview(changeCameraButton)
        
        view.addSubview(viewRecordButton)
        
        view.addSubview(segmentedControl)
        
        view.addSubview(postButton)
        
        postButton.alpha = 0.0
        
    }
    
    override func viewDidLayoutSubviews() {
        
        previewView.videoPreviewLayer.frame = self.view.frame
        
        view.layer.addSublayer(previewView.videoPreviewLayer)
        
        //        view.bringSubview(toFront: changeCameraButton)
        //
        //        view.bringSubview(toFront: viewRecordButton)
        //
        //        view.bringSubview(toFront: segmentedControl)
        //
        //        view.bringSubview(toFront: postButton)
        
    }
    
    func segmentedControlChange(_ sender: UISegmentedControl) {
        
    }
    /*
     func changeMode(_ sender: UISegmentedControl) {
     toggleCaptureMode()
     }
     
     func recordButtonFunction(_ sender: UIButton) {
     toggleMovieRecording()
     }
     
     func toggleCameraFunction(_ sender: UIButton) {
     changeCamera()
     }
     */
    func postButtonFunction(_ sender: UIButton) {
        
        if let url = _videoURL {
            let videoName = "\(NSUUID().uuidString)\(url)"
            let ref = DataService.instance.artistVideosStorageRef.child(videoName)
            
            let task = ref.putFile(url, metadata: nil, completion: { (meta, error) in
                
                if error != nil {
                    print("Error uploading video: \(error?.localizedDescription)")
                }
                    
                else {
                    let downloadURL = meta!.downloadURL()
                    
                    let afterPostView = AfterPostView()
                    
                    afterPostView.downloadedURL = downloadURL
                    
                    self.present(afterPostView, animated: true, completion: nil)
                    
                }
            })
        }
            
        else {
            
            
            
        }
        
    }
    
}





