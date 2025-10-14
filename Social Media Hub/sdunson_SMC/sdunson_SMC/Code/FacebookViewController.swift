//
//  FacebookViewController.swift
//  sdunson_SMC
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit
import WebKit


class FacebookViewController: UIViewController {
    @IBOutlet weak var fbWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myUrl = URL(string: "https://www.facebook.com")
        let myRequest = URLRequest(url: myUrl!)
        fbWebView.load(myRequest)
    }
    

}
