//
//  ViewController.swift
//  sdunson_fv1
//
//  Created by Shavaughn Dunson on 10/14/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var aLabel: UILabel!
    
    var questions: [String] = []
    var answers: [String] = []
    var currentCard: Int = 0
    
    func loadCards(){
        questions.append(contentsOf: ["What is the capital of Alaska?", "What is the capital of Brazil?", "What is the capital of France?", "What is the capital of Japan?"])
        answers.append(contentsOf: ["Juneau", "Brasília", "Paris", "Tokyo"])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadCards()
        currentCard = 0
        qLabel.text = questions[currentCard]
        aLabel.text = "???"
    }
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentCard += 1
        if(currentCard >= answers.count){
            currentCard = 0
        }
        qLabel.text = questions[currentCard]
        aLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        if(aLabel.text == "???"){
            aLabel.text = answers[currentCard]
        }else{
            aLabel.text = "???"
        }
    }
    

}

