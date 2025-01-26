//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
//    let softTime = 5
//    let mediumTime = 10
//    let hardTime = 12
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
//        if hardness == "Soft" {
//                    print(softTime)
//                } else if hardness == "Medium" {
//                    print(mediumTime)
//                } else {
//                    print(hardTime)
//                }
//                
//                switch hardness {
//                case "Soft":
//                    print(softTime)
//                case "Medium":
//                    print(mediumTime)
//                case "hard":
//                    print(hardTime)
//                default:
//                    print("Error")
//                }
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = Float(percentageProgress)
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
        }
    }
    
    
}
