//
//  ViewController.swift
//  sdunson_AlarmClock
//
//  Created by Shavaughn Dunson on 11/8/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var secondsInput: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var myImages: [UIImage] = []
    var myTimer = Timer()
    var startTime = TimeInterval()
    var elapsedTime = TimeInterval()
    var selTime: Double = 0
    var alarmGoing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load Images
        for i in 1...5{
            myImages.append(UIImage(named: "IMG_\(i).JPG")!)
            
        }
        imageView.animationImages = myImages
        imageView.animationDuration = 1.5
        imageView.image = myImages[0]
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime(){
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm:ss"
        let convertedTimeString = formatter.string(from: date as Date)
        TimeLabel.text = convertedTimeString
        elapsedTime = NSDate.timeIntervalSinceReferenceDate - startTime
        if(alarmGoing && elapsedTime > selTime){
            imageView.startAnimating()
            alarmGoing = false
            TimeLabel.textColor = .black
        }
        
    }
    
    
    
    @IBAction func StartButton(_ sender: Any) {
        view.endEditing(true)
        if let remTime = Double(secondsInput.text!){
            selTime = remTime
            startTime = NSDate.timeIntervalSinceReferenceDate
            alarmGoing = true
            TimeLabel.textColor = .red
        }
    }
    @IBAction func ResetButton(_ sender: Any) {
        view.endEditing(true)
        if(imageView.isAnimating){
            imageView.stopAnimating()
        }
        imageView.image = myImages[0]
        secondsInput.text = "Time(s)"
    }
    

}

