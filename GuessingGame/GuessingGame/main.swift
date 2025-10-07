//
//  main.swift
//  GuessingGame
//
//  Created by Shavaughn Dunson on 9/9/25.
//

import Foundation

let secretNumber = Int.random(in: 0...100) //Number for users to guess
var myTries: Int = 0 //Number of user guesses
var myGuess: Int = -1 //User's guess


print("Welcome to the guessing game! Please guess an integer between 0 and 100.")
repeat{
    //read user input
    print("Enter your guess:")
    let inputString = readLine()
    //string to int
    if let numValue = Int(inputString!){
        myGuess = numValue
    }else{
        print("Invalid input 🙅🏿‍♂️")
        continue
    }
    myTries += 1
    //based on input, give user a hint
    if(myGuess > secretNumber){
        print("Too high, try again!")
    }else if (myGuess < secretNumber){
        print("Too low, try again!")
    }
}while myGuess != secretNumber

print("Congrats! You guessed it! 👏🏿 \nIt took you \(myTries) tries.")
if(myTries == 1){
    print("First try? You gotta be cheating 😒")
}
