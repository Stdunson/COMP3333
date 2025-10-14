//
//  ViewController.swift
//  sdunson_webkit
//
//  Created by Shavaughn Dunson on 10/9/25.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://instagram.com")
        let myRequest = URLRequest(url: myURL!)
        myWebView.load(myRequest)
    }


}

