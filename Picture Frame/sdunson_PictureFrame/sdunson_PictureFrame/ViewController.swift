//
//  ViewController.swift
//  sdunson_PictureFrame
//
//  Created by Shavaughn Dunson on 9/18/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var MyPicture: UIImageView!
    var alpha: Double = 1.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        alpha = 1.0
    }

    @IBAction func clickMeButton(_ sender: Any) {
        alpha = alpha - 0.2
        if alpha < 0.0 {
            alpha = 1.0
        }
        MyPicture.alpha = CGFloat(alpha)
    }
    
}

