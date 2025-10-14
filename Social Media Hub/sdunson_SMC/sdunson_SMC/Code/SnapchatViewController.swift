//
//  SnapchatViewController.swift
//  sdunson_SMC
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit
import WebKit

class SnapchatViewController: UIViewController {

    @IBOutlet weak var snapWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myUrl = URL(string: "https://www.snapchat.com/")
        let request = URLRequest(url: myUrl!)
        snapWebView.load(request)
    }
    

}
