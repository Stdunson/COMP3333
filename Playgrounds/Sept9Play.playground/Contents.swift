import UIKit

func myCalculator(num1: Int, num2: Int) -> (Int, Double?){
    let result1 = num1 * num2
    if(num2 == 0){
        return (result1, nil)
    }
    let result2: Double? = Double(num1) / Double(num2);
    
    return(result1, result2)
}

let (product, quotient) = myCalculator(num1: 10, num2: 20)
print("Product: \(product)")
if let q = quotient {
    print("Quotient: \(q)")
} else {
    print("Cannot divide by zero")
}

