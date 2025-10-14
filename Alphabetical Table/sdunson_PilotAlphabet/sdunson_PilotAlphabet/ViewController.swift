//
//  ViewController.swift
//  sdunson_PilotAlphabet
//
//  Created by Shavaughn Dunson on 10/7/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var inputOutlet: UITextField!
    @IBOutlet weak var alphabetOutlet: UILabel!
    var pilotWordDictionary: [String: String] = [:]
    
    /*
    func initializeDict(){
        pilotWordDictionary["A"] = "Alpha"
        pilotWordDictionary["B"] = "Bravo"
        pilotWordDictionary["C"] = "Charlie"
        pilotWordDictionary["D"] = "Delta"
        pilotWordDictionary["E"] = "Echo"
        pilotWordDictionary["F"] = "Foxtrot"
        pilotWordDictionary["G"] = "Golf"
        pilotWordDictionary["H"] = "Hotel"
        pilotWordDictionary["I"] = "India"
        pilotWordDictionary["J"] = "Juliet"
        pilotWordDictionary["K"] = "Kilo"
        pilotWordDictionary["L"] = "Lima"
        pilotWordDictionary["M"] = "Mike"
        pilotWordDictionary["N"] = "November"
        pilotWordDictionary["O"] = "Oscar"
        pilotWordDictionary["P"] = "Papa"
        pilotWordDictionary["Q"] = "Quebec"
        pilotWordDictionary["R"] = "Romeo"
        pilotWordDictionary["S"] = "Sierra"
        pilotWordDictionary["T"] = "Tango"
        pilotWordDictionary["U"] = "Uniform"
        pilotWordDictionary["V"] = "Victor"
        pilotWordDictionary["W"] = "Whiskey"
        pilotWordDictionary["X"] = "X ray"
        pilotWordDictionary["Y"] = "Yankee"
        pilotWordDictionary["Z"] = "Zulu"
    }
    */
    
    func getPilotWord(forLetter: String) -> String {
        switch forLetter{
        case "A":
            return "Alpha"
        case "B":
            return "Bravo"
        case "C":
            return "Charlie"
        case "D":
            return "Delta"
        case "E":
            return "Echo"
        case "F":
            return "Foxtrot"
        case "G":
            return "Golf"
        case "H":
            return "Hotel"
        case "I":
            return "India"
        case "J":
            return "Juliet"
        case "K":
            return "Kilo"
        case "L":
            return "Lima"
        case "M":
            return "Mike"
        case "N":
            return "November"
        case "O":
            return "Oscar"
        case "P":
            return "Papa"
        case "Q":
            return "Quebec"
        case "R":
            return "Romeo"
        case "S":
            return "Sierra"
        case "T":
            return "Tango"
        case "U":
            return "Uniform"
        case "V":
            return "Victor"
        case "W":
            return "Whiskey"
        case "X":
            return "X-ray"
        case "Y":
            return "Yankee"
        case "Z":
            return "Zulu"
        default:
            return "Error"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        inputOutlet.delegate = self
    }
    
    //called automatically upon return in text field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        //inputOutlet.resignFirstResponder()
        
        if let input = inputOutlet.text{
            if(input.count == 0 || input.count > 1 || input.uppercased() < "A" || input.uppercased() > "Z"){
                //invalid input message
                alphabetOutlet.text = "1 LETTER ONLY"
            }else{
                alphabetOutlet.text = getPilotWord(forLetter: input.uppercased())
            }
        }else{
            alphabetOutlet.text = "1 LETTER ONLY"
        }
        
        return true
    }


}

