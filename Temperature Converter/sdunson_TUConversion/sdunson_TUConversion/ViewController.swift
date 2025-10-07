//
//  ViewController.swift
//  sdunson_TUConversion
//
//  Created by Shavaughn Dunson on 9/25/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var FahrenheitField: UITextField!
    @IBOutlet weak var CelciusField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FahrenheitField.delegate = self
        CelciusField.delegate = self
        
        FahrenheitField.text = "32.0"
        CelciusField.text = "0.0"
    }
    
    
    //displayAlert(msgTitle: "Ready", msgContent: "Go")
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent,
                                                preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    

    
    //convert C input value to F
    @IBAction func CtoF(_ sender: Any) {
        FahrenheitField.resignFirstResponder()
        CelciusField.resignFirstResponder()
        
        if let tInCx = Float(CelciusField.text!){
            let tF = (tInCx * 9.0) / 5.0 + 32.0
            FahrenheitField.text = String(format: "%.1f", tF)
        }else{ //invalid
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
        }
    }
    
    //convert F input value to C
    @IBAction func FtoC(_ sender: Any) {
        FahrenheitField.resignFirstResponder()
        CelciusField.resignFirstResponder()
        
        if let tInFx = Float(FahrenheitField.text!){
            let tC = (tInFx - 32.0) * 5.0 / 9.0
            CelciusField.text = String(format: "%.1f", tC)
        }else{ //invalid
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
        }
    }
    
}

