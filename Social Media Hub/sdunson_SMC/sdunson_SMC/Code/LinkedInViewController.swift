//
//  LinkedInViewController.swift
//  sdunson_SMC
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit
import WebKit

class LinkedInViewController: UIViewController {

    @IBOutlet weak var linkedinWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myURL = URL(string: "https://www.linkedin.com")
        let myRequest = URLRequest(url: myURL!)
        linkedinWebView.load(myRequest)
        
    }
    

}
