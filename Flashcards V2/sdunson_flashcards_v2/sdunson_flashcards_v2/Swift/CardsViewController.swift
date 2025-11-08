//
//  CardsViewController.swift
//  sdunson_flashcards_v2
//
//  Created by Shavaughn Dunson on 10/18/25.
//

import UIKit

var questions: [String] = []
var answers: [String] = []

class CardsViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var curr: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if(!questions.isEmpty){
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }else{
            questionLabel.text = "No Question Found"
            answerLabel.text = "No Question Found"
        }
        
    }
    
    func displayAlert(msgTitle:String, msgContent:String){
        let alertController = UIAlertController(title: msgTitle, message: msgContent, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func deleteQuestion(_ sender: Any) {
        if(!questions.isEmpty){
            questions.remove(at: curr)
            answerLabel.text = "???"
            answers.remove(at: curr)
            if(curr >= questions.count){
                curr -= 1
            }
        }else if(questionLabel.text == "No Question Found" || answerLabel.text == "No Question Found"){
            displayAlert(msgTitle: "DISPLAY ERROR", msgContent: "No Question Shown")
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }else{
            displayAlert(msgTitle: "ERROR", msgContent: "No Question Found")
        }
        if(questions.isEmpty){
            questionLabel.text = "No Question Found"
            answerLabel.text = "No Question Found"
        }else{
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        if(!questions.isEmpty && questionLabel.text != "No Question Found" && answerLabel.text != "No Question Found"){
            curr += 1
            if(curr >= questions.count){
                curr = 0
            }
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }else if(!questions.isEmpty && (questionLabel.text == "No Question Found" || answerLabel.text == "No Question Found")){
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }else{
            displayAlert(msgTitle: "ERROR", msgContent: "No Question Found")
        }
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        if(!questions.isEmpty){
            answerLabel.text = answers[curr]
        }else if(questionLabel.text == "No Question Found" || answerLabel.text == "No Question Found"){
            displayAlert(msgTitle: "DISPLAY ERROR", msgContent: "No Question Shown")
            if(questions[curr].hasSuffix("?")){
                questionLabel.text = questions[curr]
            }else{
                questionLabel.text = questions[curr] + "?"
            }
            answerLabel.text = "???"
        }else{
            displayAlert(msgTitle: "ERROR", msgContent: "No Question Found")
        }
    }
    
    
}
