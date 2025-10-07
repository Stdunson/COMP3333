//
//  ViewController.swift
//  sdunson_tipCalculator
//
//  Created by Shavaughn Dunson on 10/1/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var NewDollarAmt: UITextField!
    @IBOutlet weak var Subtotal: UILabel!
    @IBOutlet weak var Tax: UILabel!
    @IBOutlet weak var Tip: UITextField!
    @IBOutlet weak var TipAmt: UILabel!
    
    @IBOutlet weak var Total: UILabel!
    var subtotal: Double = 0.0
    var tax: Double = 0.0
    var tip : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NewDollarAmt.delegate = self
        Tip.delegate = self
        NewDollarAmt.text = "Dollar Amount($)"
        Tip.text = "Tip Percentage(%)"
        Subtotal.text = "$0.00"
        Tax.text = "$0.00"
        Total.text = "$0.00"
        TipAmt.text = "$0.00"
    }
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func AddItem(_ sender: Any) {
        if let text = NewDollarAmt.text, let amount = Double(text) {
            subtotal = subtotal + amount
            Subtotal.text = String(format: "$%.2f", subtotal)
            tax = subtotal * 0.0825
            Tax.text = String(format: "$%.2f", tax)
            Total.text = String(format: "$%.2f", subtotal + tax + tip)
        }else{
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
        }
    }
    
    @IBAction func AddTip(_ sender: Any) {
        if let text = Tip.text, let tipPercent = Double(text) {
            tip = subtotal * (tipPercent/100)
            TipAmt.text = String(format: "$%.2f", tip)
            Total.text = String(format: "$%.2f", subtotal + tax + tip)
        }else{
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
        }
    }
    
}

