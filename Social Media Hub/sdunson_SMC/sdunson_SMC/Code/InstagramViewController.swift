//
//  InstagramViewController.swift
//  sdunson_SMC
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit
import WebKit

class InstagramViewController: UIViewController {

    @IBOutlet weak var igWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://instagram.com")
        let myRequest = URLRequest(url: myURL!)
        igWebView.load(myRequest)
    }

}
