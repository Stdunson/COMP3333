//
//  ViewController.swift
//  sdunson_buttonLabel
//
//  Created by Shavaughn Dunson on 9/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CountLabel: UILabel!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0
        CountLabel.text = "0"
    }

    @IBAction func ButtonClicked(_ sender: Any) {
        count += 1
        if count > 999 {
            count = 0
        }
        CountLabel.text = "\(count)"
    }
    
}

