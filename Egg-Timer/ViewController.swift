//
//  ViewController.swift
//  Egg-Timer
//
//  Created by Varun Kumar on 05/04/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    let eggTimes = ["Boiling":3,"MediumBoiled": 5,"Fully Boiled": 8]
    
    var totalTime = 0
    var secondsPassed = 0
    var tymer = Timer()
    var player: AVAudioPlayer!
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    
    @IBAction func boillingProcessSelection(_ sender: UIButton) {
          
        secondsPassed = 0
        tymer.invalidate()
        progressBar.progress = 0.0
        let hardNess = sender.currentTitle!
        titleLabel.text =  hardNess
        totalTime = eggTimes[hardNess]!
        
        
        tymer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed ) / Float (totalTime)
            print("\(secondsPassed) seconds to the end of the world")
        } else {
            tymer.invalidate()
            titleLabel.text = "DONE"
            playSound(soundTrackName: "alarm_sound")
        }
    }
    
    func playSound(soundTrackName: String) {
        let url = Bundle.main.url(forResource: soundTrackName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

    
}

//        if (hardNess == "Boiling")  {
//            print(eggTimes[hardNess] ?? "")
//        } else if (hardNess == "Medium Boiled") {
//            print(eggTimes[hardNess] ??  "")
//        } else if (hardNess  == "Fully Boiled"){
//            print(eggTimes[hardNess] ??  "")
//        } else{
//            print("no process")
//        }
