//
//  ViewController.swift
//  Bip The Guy
//
//  Created by Vincent Stephen Huang on 9/14/17.
//  Copyright © 2017 Huang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Functions
    func animateImage() {
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        //shrink our image by 60 pixels
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue,
                                          y: self.imageToPunch.bounds.origin.y + shrinkValue,
                                          width: self.imageToPunch.bounds.size.width - shrinkValue,
                                          height: self.imageToPunch.bounds.size.height - shrinkValue)
        
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 10, options: [],
                       animations: {self.imageToPunch.bounds = bounds},
                       completion: nil)
    
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("ERROR: Could not load data from file \(soundName)")
        }
    }
    

    //MARK: Actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    

    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
}

