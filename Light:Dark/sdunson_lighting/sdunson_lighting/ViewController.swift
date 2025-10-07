//
//  ViewController.swift
//  sdunson_lighting
//
//  Created by Shavaughn Dunson on 9/23/25.
//

import UIKit

class ViewController: UIViewController {

    var isLight: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        isLight = true
        view.backgroundColor = .white
    }

    @IBAction func ButtonClicked(_ sender: Any) {
        isLight = !isLight
        if isLight {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = .black
        }
        
    }
    
}
