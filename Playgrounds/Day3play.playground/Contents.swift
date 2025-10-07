import UIKit

var letters = ["a", "b", "c", "d", "e"]

for letter in letters {
    print(letter)
}

for (index, letter) in "MyGloriousWord".enumerated(){
    print("\(index): \(letter)")
}
