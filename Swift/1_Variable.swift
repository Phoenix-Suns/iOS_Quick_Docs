import UIKit

// Variable
var myName = "Hello, playground"
myName = "Nghia" // Nghia
// Int, String, Bool, Float, Double

// Constant
let myAge = 30  // 30
let myAgeInTenYears : Int = myAge + 10 // 40

// Array
let array = [1,3,5,6,4]

// Plus String
let fullName = "My Name is \(myName)" // Output: My Name is Nghia

String(format: "%.2f", 3.1456)  // 3.14

// ép kiểu
Int("4")

/*
Group Comment
*/

print("Some thing") // print Console


// Flow - loop
var sum = 0
for number in array {
    sum += number
}

for number in 1..10 {
    //...
}

// from 9 to 1 get thập phân number chia 3  = 0
for number in (1..<10).revered() where number%3 == 0 {
    print(number)
}






