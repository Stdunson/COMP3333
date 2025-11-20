//
//  ViewController.swift
//  sdunson_RSP
//
//  Created by Shavaughn Dunson on 11/11/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cpuLabel: UILabel!
    var cpuChoice = 0 //1 is rock, 2 is paper, 3 is scissors
    
    @IBOutlet weak var gameMessageLabel: UILabel!
    var isSelected = false
    
    @IBOutlet weak var scoreLabel: UILabel!
    var wins = 0
    var losses = 0
    var ties = 0
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    var userChoice = 0
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        gameMessageLabel.text = "Rock Paper Scissors? Select One Below"
    }
    
    //return 1 if choice1 win, 2 if choice2 win, 0 if tie
    func determineWinner(choice1: Int, choice2: Int) -> Int{
        if choice1 == choice2{
            return 0
        }else if abs(choice1 - choice2) == 1{
            if choice1 > choice2{
                return 1
            }else{
                return 2
            }
        }else{
            if choice1 < choice2{
                return 1
            }else{
                return 2
            }
        }
    }
    
    func displayText(winner: Int){
        if winner == 1{
            wins += 1
            scoreLabel.text = "Score: \(wins)-\(losses)-\(ties)"
            gameMessageLabel.text = "You Win!"
        }else if winner == 2{
            losses += 1
            scoreLabel.text = "Score: \(wins)-\(losses)-\(ties)"
            gameMessageLabel.text = "You Lose!"
        }else if winner == 0{
            ties += 1
            scoreLabel.text = "Score: \(wins)-\(losses)-\(ties)"
            gameMessageLabel.text = "It's a Tie!"
        }
    }
    
    func displayCPUChoice(){
        if cpuChoice == 1{
            cpuLabel.text = "🪨"
        }else if cpuChoice == 2{
            cpuLabel.text = "📄"
        }else if cpuChoice == 3{
            cpuLabel.text = "✂️"
        }
    }
    
    @IBAction func rockButtonSelect(_ sender: Any) {
        cpuChoice = Int.random(in: 1...3)
        displayCPUChoice()
        if !isSelected{
            userChoice = 1
            isSelected = true
        }else{
            return
        }
        let theWinner = determineWinner(choice1: userChoice, choice2: cpuChoice)
        displayText(winner: theWinner)
    }
    
    @IBAction func paperButtonSelect(_ sender: Any) {
        cpuChoice = Int.random(in: 1...3)
        displayCPUChoice()
        if !isSelected{
            userChoice = 2
            isSelected = true
        }else{
            return
        }
        let theWinner = determineWinner(choice1: userChoice, choice2: cpuChoice)
        displayText(winner: theWinner)
    }
    
    @IBAction func scissorsButtonSelect(_ sender: Any) {
        cpuChoice = Int.random(in: 1...3)
        displayCPUChoice()
        if !isSelected{
            userChoice = 3
            isSelected = true
        }else{
            return
        }
        let theWinner = determineWinner(choice1: userChoice, choice2: cpuChoice)
        displayText(winner: theWinner)
    }
    
    @IBAction func playAgainButtonSelect(_ sender: Any) {
        if isSelected{
            gameMessageLabel.text = "Rock Paper Scissors? Select One Below"
            cpuLabel.text = "🤖"
            userChoice = 0
            cpuChoice = 0
            isSelected = false
        }
    }
    
    
}

