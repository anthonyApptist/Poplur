//
//  PoplurScreenManager.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-12-17.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit

class PoplurScreenManager: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    
    var nextScreen: PoplurScreenManager?
    var currentVC: PoplurScreen!
    
    var initialSetup = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if initialSetup == true {
            
           self.willMove(toParentViewController: self)
           currentVC = (storyboard?.instantiateViewController(withIdentifier: "HomeVC")) as! HomeScreen
           containerView.addSubview(currentVC.view)
           self.didMove(toParentViewController: self)
            
        } else {
            
            self.setCurrentView()
            
        }
        NotificationCenter.default.addObserver(forName: myNotification, object: nil, queue: nil, using: loadScreen)

    }
    
    func loadScreen(notification: Notification) {
        
        if currentState == remoteStates[0] {
     //       performSegue(withIdentifier: "GoUp", sender: self)
        } else if currentState == remoteStates[1] {
            performSegue(withIdentifier: "transitionDown", sender: self)
        } else if currentState == remoteStates[2] {
            performSegue(withIdentifier: "transitionLeft", sender: self)
        } else if currentState == remoteStates[3] {
            performSegue(withIdentifier: "transitionRight", sender: self)
        } else if currentState == remoteStates[4] {
            performSegue(withIdentifier: "transitionMiddle", sender: self)
        } else if currentState == remoteStates[5] {
            performSegue(withIdentifier: "transitionOther", sender: self)
        } else if currentState == remoteStates[6] {
            performSegue(withIdentifier: "transitionOther", sender: self)
        }
    }
    
    func setCurrentView() {
    
        self.willMove(toParentViewController: self)
        
        switch currentVC.name {
        case .home:
            currentVC = (storyboard?.instantiateViewController(withIdentifier: "HomeVC")) as! HomeScreen
        case .logIn:
            currentVC = (storyboard?.instantiateViewController(withIdentifier: "LogInVC")) as! LogInScreen
        case .signUp:
            currentVC = (storyboard?.instantiateViewController(withIdentifier: "SignUpVC")) as! SignUpScreen
        case .profile:
            currentVC = (storyboard?.instantiateViewController(withIdentifier: "ProfileVC")) as! ProfileScreen
        case .camera:
            currentVC = CameraContainer()
        default:
            break
            
        }
        
        containerView.addSubview(currentVC.view)
        self.didMove(toParentViewController: self)

    
    }
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        


        
        if segue.identifier == "transitionDown" {
            
            //currentVC.down
            self.nextScreen = segue.destination as? PoplurScreenManager
            self.nextScreen?.currentVC = self.currentVC.downVC
            self.nextScreen?.initialSetup = false
            
        } else if segue.identifier == "transitionLeft" {
            
            //currentVC.left
            self.nextScreen = segue.destination as? PoplurScreenManager
            self.nextScreen?.currentVC = self.currentVC.leftVC
            self.nextScreen?.initialSetup = false

            
        } else if segue.identifier == "transitionRight" {
            
            //currentVC.right
            self.nextScreen = segue.destination as? PoplurScreenManager
            self.nextScreen?.currentVC = self.currentVC.rightVC
            self.nextScreen?.initialSetup = false

            
        } else if segue.identifier == "transitionMiddle" {
            
            //currentVC.middle
            self.nextScreen = segue.destination as? PoplurScreenManager
            if currentState == remoteStates[4] {
                if self.currentVC.name == .camera {
                    
                } else {
                    self.nextScreen?.currentVC = self.currentVC.middleVC
                    
                }
            }
            
            self.nextScreen?.initialSetup = false
        }
        
        else if segue.identifier == "transitionOther" {
            
            //currentVC.middle
            self.nextScreen = segue.destination as? PoplurScreenManager
            if(currentState == remoteStates[5]) {
            self.nextScreen?.currentVC = self.currentVC.logInVC
            } else if(currentState == remoteStates[6]) {
                self.nextScreen?.currentVC = self.currentVC.signUpVC
            }
            self.nextScreen?.initialSetup = false
            
            
        }
     }



}
