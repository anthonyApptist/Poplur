//
//  CustomLabels.swift
//  Poplur
//
//  Created by Mark Meritt on 2016-11-13.
//  Copyright © 2016 Apptist. All rights reserved.
//

import UIKit
import AVFoundation


class CircleButton: UIButton {
    
    var audioPlayer: AVAudioPlayer!
    
   required override init(frame: CGRect) {
        super.init(frame: frame)
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
     //   fatalError("init(coder:) has not been implemented")
        let radius = self.frame.width/2
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func animateRadius(scale: CGFloat, soundOn: Bool) {
        
        UIView.animate(withDuration: 0.5, animations: {
            if(soundOn) {
             self.playSound()
            }
            self.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
        
        }, completion: { (finish) in
            UIView.animate(withDuration: 0.5, animations: {
                self.transform = CGAffineTransform.identity
                
            })
        })
    }
    
    func setColorRed() {
        self.backgroundColor = UIColor.init(red: 212/255, green: 107/255, blue: 107/255, alpha: 1.0)
    }
    
    func setColorBlue() {
        self.backgroundColor = UIColor.init(red: 58/255, green: 93/255, blue: 131/255, alpha: 1.0)
    }
    
    func setColorGreen() {
        self.backgroundColor = UIColor.init(red: 58/255, green: 131/255, blue: 108/255, alpha: 1.0)
    }
    
    func setColorOrange() {
        self.backgroundColor = UIColor.init(red: 211/255, green: 115/255, blue: 76/255, alpha: 1.0)
    }
    
    func setColorClear() {
        self.backgroundColor = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.80)
    }
    
    func addText(string: String, color: Int) {
        self.titleLabel?.font = UIFont(name: "MyriadPro-Semibold", size: 20.5)
        self.setTitle(string, for: UIControlState.normal)
        self.setSpacing(space: 0.1)
        if(color == 0) {
                self.setTitleColor(UIColor.black, for: UIControlState.normal)
        } else {
            self.setTitleColor(UIColor.init(red: 134/255, green: 69/255, blue: 69/255, alpha: 1.0), for: UIControlState.normal)
        }
    }
    
    func addBorder() {
        self.layer.borderWidth = 2.88
        self.layer.borderColor = UIColor.black.cgColor
    }
    
   private func playSound(){
        
        let poppingSound = URL(fileURLWithPath: Bundle.main.path(forResource: "pop", ofType: "mp3")!)
    
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: poppingSound)
        audioPlayer.prepareToPlay()
        audioPlayer.setVolume(0.1, fadeDuration: 0.1)
        audioPlayer.play()
      } catch {
            print("Error getting the audio file")
      }
    }
    
    


}
