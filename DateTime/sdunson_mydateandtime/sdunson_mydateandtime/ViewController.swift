//
//  ViewController.swift
//  sdunson_mydateandtime
//
//  Created by Shavaughn Dunson on 10/28/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    var myTimer = Timer()
    
    @objc func updateTime() {
        let date = NSDate() //get current time
        
        //display date
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "MMM dd, yyyy"
        let convertedString = myDateFormatter.string(from: date as Date)
        dateLabel.text = convertedString
        //display time
        myDateFormatter.dateFormat = "h:mm:ss"
        let convertedTimeString = myDateFormatter.string(from: date as Date)
        timeLabel.text = convertedTimeString
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTime), userInfo: nil, repeats: true)
    }

}

