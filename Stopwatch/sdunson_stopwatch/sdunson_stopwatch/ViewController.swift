//
//  ViewController.swift
//  sdunson_stopwatch
//
//  Created by Shavaughn Dunson on 11/4/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var buttonLabel: UIButton!
    
    var myTimer = Timer()
    var isRunning = false
    var startTime = TimeInterval()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timer.text = "00:00:00"
        buttonLabel.setTitle("START", for: .normal)
        isRunning = false
    }

    @objc func updateTime(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var elapsedTime: TimeInterval = currentTime - startTime
        
        let minutes = UInt8(elapsedTime) / 60
        
        elapsedTime -= TimeInterval(minutes) * 60
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= TimeInterval(seconds)
        let ms = UInt8(elapsedTime * 100)

        timer.text = String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds) + ":" + String(format: "%02d", ms)
    }
    
    @IBAction func pressButton(_ sender: Any) {
        if isRunning{
            isRunning = false
            buttonLabel.setTitle("START", for: .normal)
            myTimer.invalidate() //stops clock
        }else{
            isRunning = true
            buttonLabel.setTitle("STOP", for: .normal)
            timer.text = "00:00:00"
            startTime = NSDate.timeIntervalSinceReferenceDate
            myTimer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
        }
    }
    
}

