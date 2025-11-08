//
//  AddViewController.swift
//  sdunson_flashcards_v2
//
//  Created by Shavaughn Dunson on 10/18/25.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var newQuestion: UITextField!
    @IBOutlet weak var newAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }

    @IBAction func addQuestion(_ sender: Any) {
        if newQuestion.text == "" || newAnswer.text == ""{
            self.view.endEditing(true)
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
            resignFirstResponder()
        }else if let question = newQuestion.text, let answer = newAnswer.text {
            newQuestion.text = ""
            newAnswer.text = ""
            questions.append(question)
            answers.append(answer)
            self.view.endEditing(true)
            displayAlert(msgTitle: "SUCCESS", msgContent: "Card Successfully Added")
            resignFirstResponder()
        }else{
            self.view.endEditing(true)
            displayAlert(msgTitle: "ERROR", msgContent: "Invalid Input")
            resignFirstResponder()
        }
        
    }
}
