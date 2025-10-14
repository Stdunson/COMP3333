//
//  InfoViewController.swift
//  sdunson_myTabbedApp
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit
import WebKit

class InfoViewController: UIViewController {

    @IBOutlet weak var snap: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl = URL(string: "https://www.snapchat.com/")
        let request = URLRequest(url: myUrl!)
        snap.load(request)
        // Do any additional setup after loading the view.
    }
    

}
