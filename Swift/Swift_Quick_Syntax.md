# Swift Quick Syntax

## FILE TYPE

*.swift

## HELLO WORLD

```swift
import UIKit

var greeting = "Hello, playground"
print(greeting) // Show on Console
```

## COMMENT

```swift
// Single Comment

/*
Group Comment
*/
```

## VARIABLE

- Declare Variable
- Assign Variable
- Variable Types
- Using Variable
- Constant/ final
- Generic Variable - kiểu chung T

```swift
// Declare
var myName = "Hello, playground"
myName = "Nghia" // Assign Variable

// Types: Int, String, Bool, Float, Double

// Constant
let myAge = 30  // 30
let myAgeInTenYears : Int = myAge + 10 // 40
```

### Optional (null able)

```swift
let name1: String = "name1"
var name2: String?  // Có thể nil (wrapping)
var name3: String!  // Không nil, khai báo sau (unwrapping)

// null safety, unwrapping
print("name2: \(name2 ?? "")")

// Check nil
if name2 != nil { }

// Check Object
var dog: Animal?
//dog = Animal()
//dog?.name = "abc"
print("dog name: \(dog?.name ?? "")")
```

## ENUM

```swift
// Declare
enum CompassPoint {
    case north
    case south
    case east
    case west

    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune  // Multiple cases

    case enumFunction(Int, Int)     // Func Cases

    case enumValue = "nghia"        // Raw value
    // CompassPoint(rawValue: 7)    // Set Raw value
}

// Using
var directionToHead = CompassPoint.west
directionToHead = .east // Simple Using
directionToHead = .enumFunction(8, 85909)
let getRawValue = CompassPoint.enumValue.rawValue   // nghia

switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    case .enumFunction(let product, let check):
        print("ENUM FUNCTION: \(product), \(check).")
    default:
        print("Not a safe place for humans")
}

// Count case
CompassPoint.allCases.count // 12 cases

```

## OPERATOR

```swift
+ - * / %(lấy dư)
++ --
+= -= *= /= *=
< > <= >= == !=
&& || !
is !is(là kiểu) in !in(trong list)

// Assign
let b = 10
var a = 5
a = b   // a = 10

// Multiple Assign
let (x, y) = (1, 2) // x=1, y=2

// Compare Multiple
(4, "dog") == (4, "dog") // true because 4 is equal to 4, and "dog" is equal to "dog"

// ép kiểu
Int("4")
```

## STRING

```swift
// Plus String
let fullName = "My Name is \(myName)"
String(format: "%.2f", 3.1456)  // 3.14
```

## ARRAY

```swift
// Declare
let names = ["Anna", "Alex", "Brian", "Jack"]
var emptyDoubles: [Double] = []
var emptyFloats: Array<Float> = Array()

// Get Item thứ 2
names[2]

// Assign
names[2] = "nghia"

// Add Item
names.append("Maxime")
names.append(contentsOf: ["Shakia", "William"])
names.students.insert("Liam", at: 3)

// Remove Item
names.remove(at: 0)

// kiểm tra item tồn tại
names.contains("Anna") // true

names.isEmpty // kt rỗng
.count   // đếm item

for i in 0..<names.count { 
    // i = index of names
}
// 1...5 từ 1 đến 5
// names[2...] lấy từ 2
// names[...2] lấy tới 2
// names[..<2] lấy nhỏ hơn 2
```

## CONDITIONAL

```swift
// IF
var weather = "rainy" 

if weather == "sunny" {
  print("Grab some sunscreen")
} else if weather == "rainy" {
  print("Grab an umbrella")
} else {
  print("Invalid weather")
}

// Switch
switch weather {
    case "orange":
        print("Mix of red and yellow")
    case "green":
        print("Mix of blue and yellow")
    case "purple":
        print("Mix of red and blue")
    default: 
        print("This might not be a secondary color.") 

  // case "Uber", "Lyft": // Multiple Case
  // case 1860...1885: // số từ 1860 đến 1885
  // Case with condition
    case let x where x % 2 == 0:
        print("\(num) is even")
}

// Ternary conditional
question ? answer1 : answer2

var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? "red"
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
```

### GUARD

```swift
guard condition else {
    // Nếu condition == false thì chạy Else
}

var age: Int? = 22
guard let myAge = age else {
    print("Age is undefined")
return
}
```

## LOOP
- For
- While
- Break
- Continue

### For

```swift
// For
for name in names {
    print(name)
    // break // Thoát For
    // continue // Tiếp tục chạy for, Không thực hiện code phía dưới (print("abc"))
    print("abc")
}

// For with Condition
for name in names where name != "Java"{
  print(name) 
}

for i in 0..<names.count { 
    // i = index of names
}
// 1...5 từ 1 đến 5
// names[2...] lấy từ 2
// names[...2] lấy tới 2
// names[..<2] lấy nhỏ hơn 2
// stride(from: 1, to: 10, by: 2) // từ 1 đến 10, nhảy 2 số

// Thoát khỏi For cha
outerloop: for i in 1...3{
  innerloop: for j in 1...3 {
    if j == 3 {
      break outerloop
    }
  }
}
```

### While

```swift
while (condition){
  // body of loop
}

repeat {
  // body of loop
} while (condition)
```

## LABLE
## METHOD/ FUNTION
- Define Method
- Call Method
- Parameter in Method
- Return method
- Override
- Passing Argument
- Static
- Public/ Private/ Protected

```swift
func getMilk() {
    print("nghia")
}

func getMilk(number: Int) -> String {
    return "have \(number) cartons";
}

// USING
getMilk()   //output: nghia
var numberMilk = getMilk(number: 4)  //output: have 4 cartons
```

## CLASS
- Constructor
- This
- Overriding
- Call Parent/ Super
- Struct
- Sealed
- Interface
- Abstract
- Inherit

```swift
import Foundation   //Simple Pakage

class Question {
    
    let answer : Bool
    let questionText : String
    
    // Constructor
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }

    // Function/ Action
    func doSomething(person: String) -> String {
        return "Hello, " + person + "!"
    }
}

// USING
let question = Question(text: "Are you ok?", correctAnswer: true)   // init
var saySomething = question.doSomething(person: "nghĩa à")      // Function
```

## PACKAGE/ NAMESPACE
## IMPORT
## EXCEPTION
- Try Catch
## IMPRESSION