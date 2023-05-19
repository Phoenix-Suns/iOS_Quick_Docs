# Swift Quick Syntax

- [Swift Quick Syntax](#swift-quick-syntax)
  - [FILE TYPE](#file-type)
  - [HELLO WORLD](#hello-world)
  - [COMMENT](#comment)
  - [VARIABLE](#variable)
    - [Data Types](#data-types)
    - [Optional (null able)](#optional-null-able)
  - [STRING](#string)
  - [ENUM](#enum)
  - [OPERATOR](#operator)
  - [ARRAY](#array)
    - [SET: item cannot be duplicate](#set-item-cannot-be-duplicate)
    - [Dictionary: List Item with Key](#dictionary-list-item-with-key)
    - [Tuble: Group item difference type](#tuble-group-item-difference-type)
  - [CONDITIONAL](#conditional)
    - [GUARD](#guard)
  - [LOOP](#loop)
    - [For](#for)
    - [While](#while)
  - [FUNCTION](#function)
    - [Argument](#argument)
    - [Nested Function: function inside function](#nested-function-function-inside-function)
    - [Closures: Function without name](#closures-function-without-name)
  - [CLASS](#class)
    - [Access level](#access-level)
    - [Protocols: abstract class (Blueprint class)](#protocols-abstract-class-blueprint-class)
    - [Structs](#structs)
    - [Singleton: only one class instance on project](#singleton-only-one-class-instance-on-project)
  - [PACKAGE/ NAMESPACE](#package-namespace)
  - [IMPORT](#import)
  - [EXCEPTION](#exception)
    - [Throwing Exception](#throwing-exception)
    - [Try Catch](#try-catch)
  - [IMPRESSION](#impression)
    - [Generic type](#generic-type)
    - [Extention class, protocol](#extention-class-protocol)
    - [Typealias: create new type from exist type](#typealias-create-new-type-from-exist-type)
    - [Hashable class: compare 2 object by hashValue](#hashable-class-compare-2-object-by-hashvalue)
    - [Equatable struct: compare 2 object](#equatable-struct-compare-2-object)
    - [Weak Reference: release object without all preference release](#weak-reference-release-object-without-all-preference-release)
  - [REPERENCE](#reperence)


## FILE TYPE

*.swift

## HELLO WORLD

```swift
import UIKit

var year = 2014
print("Hello world \(year)") // show in console: Hello world 2014
```

## COMMENT

```swift
// Single Comment

/*
Group Comment
*/
```

## VARIABLE

```swift
// Declare
var myName = "Hello, playground"
let myAgeInTenYears : Int = myAge + 10 // 40

// Constant
let myAge = 30  // 30

// Assign
myName = "Nghia"
```

### Data Types

```swift
Character // "s","a" --- a 16-bit Unicode character
String // "hello world!" --- represents textual data
Int	// 3, -23 --- an integer number
Float // 2.4, 3.14, -23.21 --- represents 32-bit floating-point number
Double // 2.422342412414 --- represents 64-bit floating-point number
Bool // true, false --- Any of two values: true or false
```

### Optional (null able)

```swift
let name1: String = "name1"
var name2: String?  // null able (wrapping)
var name3: String!  // not null, set value after (unwrapping)

// null safety, unwrapping
var name: String = name2 ?? ""

// Check nil
if name2 != nil { }

// Check Object
var dog: Animal?
//dog = Animal()
//dog?.name = "abc"
var dogName: String = dog?.name ?? ""
```

## STRING

```swift
var hello1 = "Hello "
var hello2 = "Hello "
var name = "Jack"
var str = String()

// multiline string 
var str: String = """
Swift is awesome
I love Swift
"""

// Plus String
let fullName = "My Name is \(myName)"
String(format: "%.2f", 3.1456)  // 3.14
hello1.append(name) // Hello Jack

// Compare
hello1 == hello2 // true

.count  // size
.isEmpty	// determines if a string is empty or not
.capitalized	// capitalizes the first letter of every word in a string
.uppercased()	// converts string to uppercase
.lowercase()	// converts string to lowercase
.hasPrefix()	// determines if a string starts with certain characters or not
.hasSuffix()	// determines if a string ends with certain characters or not

// Escape Sequences
\0	//null
\\	//plain backslash
\t	//a horizontal tab
\n	//line feed
\"	//double quote
```

## ENUM

```swift
// Declare
enum CompassPoint {
    case north
    case south
    case east
    case west

    // Multiple cases
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune  

    // Func Cases
    case enumFunction(Int, Int)     

    // Raw value
    case enumValue = "nghia"        
    // CompassPoint(rawValue: 7)    // Set Raw value
}

// Using
var directionToHead = CompassPoint.west
directionToHead = .east // Simple Using
directionToHead = .enumFunction(8, 85909) // Func Cases
let getRawValue = CompassPoint.enumValue.rawValue   // Raw value

switch directionToHead {
    case .north:
        print("Lots of planets have a north")
    case .south:
        print("Watch out for penguins")
    default:
        print("Not a safe place for humans")

    // Func Cases
    case .enumFunction(let product, let check):
        print("ENUM FUNCTION: \(product), \(check).")
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

## ARRAY

```swift
// Declare
let names = ["Anna", "Alex", "Brian", "Jack"]
var emptyDoubles: [Double] = []
var emptyFloats: Array<Float> = Array()

// Get Second Item
names[2]

// Assign
names[2] = "nghia"

// Add Item
names.append("Maxime")
names.append(contentsOf: ["Shakia", "William"])
names.students.insert("Liam", at: 3)

// Remove Item
names.remove(at: 0)

// check item exist
names.contains("Anna") // true

names.isEmpty // check null
.count   // count items

for i in 0..<names.count { 
    // i = index of names
}
// 1...5 from 1 to 5
// names[2...] get from 2
// names[...2] get to 2
// names[..<2] get less 2
```

### SET: item cannot be duplicate

```swift
// Declare
var studentID1 : Set = [1, 2, 3, 4]
var studentID2 : Set<Int> = [3, 4, 5, 6]
var emptySet = Set<Int>()

// Get item
studentID1[i]

// Add
studentID1.insert(32)

// Delete
studentID1.remove(32)

.sorted()
.forEach()
.contains()
.randomElement()
.firstIndex()
.count

// Add 2 Sets
studentID1.union(studentID2) // 1,2,3,4,5,6

// intersect 2 Sets
studentID1.intersection(studentID2) // 3,4

// Out of other Set
studentID1.subtracting(studentID2) // 1,2

// Out of intersect
studentID1.symmetricDifference(studentID2) // 1,2,5,6

// Check Child Set
var studentID1 : Set = [1, 2, 3, 4]
var studentID3 : Set<Int> = [1, 2]
studentID3.isSubset(of: studentID1)  // true

// Equal
var studentID4 : Set = [4, 1, 3, 2]
studentID1 == studentID4 // true
```

### Dictionary: List Item with Key

```swift
// Declare
var capitalCity = ["Nepal": "Kathmandu", "Italy": "Rome", "England": "London"]
// Keys are "Nepal", "Italy", "England"
// Values are "Kathmandu", "Rome", "London"
var emptyDictionary =  [Int: String]()

// Get Item
capitalCity["Japan"]
var (key,value)

// Add or Change Item
capitalCity["Japan"] = "Tokyo"

// Remove item
capitalCity.removeValue(forKey: "Japan")
// capitalCity.removeAll()

// key array
Array(capitalCity.keys) // Nepal, Italy, England

// value array
Array(cities.values) // Kathmandu, Rome, London

.sorted()	// sorts dictionary elements
.shuffled()	// changes the order of dictionary elements
.contains()	// checks if the specified element is present
.randomElement()	// returns a random element from the dictionary
.firstIndex()       // returns the index of the specified element

// For
for (key,value) in capitalCity {
  print("\(key): \(value)")
}
```

### Tuble: Group item difference type

```swift
// Declare
var product = ("MacBook", 99.99)

// Get item value
product.0   // MacBook
product.1   // 99.99

// Set item value
product.1 = 11.11

// Tuples with name
var company = (product: "AAAA", version: 2.1)
company.product // AAAA
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

    // Multiple Case
    // case "Uber", "Lyft": 

    // number from 60 to 85
    // case 60...85: 

    // Case with condition
    case let x where x % 2 == 0:
        print("\(num) is even")
}

// Ternary conditional
question ? answer1 : answer2

// Null replacement
nullVar ?? "not null value"
```

### GUARD

```swift
guard condition else {
    // IF condition == false > RUN Else
}

var age: Int? = 22
guard let myAge = age else {
    print("Age is undefined")
return
}
```

## LOOP

### For

```swift
// For
for name in names {
    print(name)
    break // Exit For
    continue // Continue next for, not run below codes
    print("abc")
}

// For with Condition
for name in names where name != "Java"{
  print(name) 
}

// LABLE: Exit Father For
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

## FUNCTION

```swift
// Define
func showName() {
    print("nghia")
}

// Using (call function)
showName()

// Return value
func getName() -> String {
    return "My name is Nghia";
}
// Call function
var name = getName()

// Return multiple value
func checkMarks() -> (String, Int) {
  return ("message", 10)
}
// Call function
var result = checkMarks()
result.0 // message
result.1 // 10
```

### Argument

```swift
// Argument
func createNewNumber(number: Int) { }
// Call function
createNewNumber(number: 4)  

// Default Argument value
func addNumbers(a: Int = 7,  b: Int = 8) { }
// Call function
addNumbers(a: 2, b: 3)
addNumbers(a: 2)
addNumbers()

// Argument label
func sum(of a: Int, and b: Int) { }
// Call function
sum(of: 2, and: 3)  

// Omit Argument Labels (Call function without label)
func sum(_ a: Int, _ b: Int) { }
// Call function
sum(2, 3)   

// Array Parameters
func sum( numbers: Int...) { }
// Call function with 3 Parameters
sum(numbers: 1, 2, 3) 

// Change Parameters after Function call
func changeName(name: inout String) {
  name = "Nghia"
}
// Using
var userName = "you"
changeName(name: &userName) // userName = "Nghia"
```

### Nested Function: function inside function

```swift
// Define
func function1() {
    //...
    func function2() {
        //...
    }
}

// Return value
func operate(symbol: String) -> (Int, Int) -> Int {

  // inner function to add two numbers 
  func add(num1:Int, num2:Int) -> Int {
    return num1 + num2
  }

  // inner function to subtract two numbers    
  func subtract(num1:Int, num2:Int) -> Int {
    return num1 - num2
  }

  let operation = (symbol == "+") ?  add : subtract
  return operation
}

// Using
let operation = operate(symbol: "+")
let result = operation(8, 3)
print("Result:", result)
```

### Closures: Function without name

```swift
// Define
var hello = {
  print("Hello World")
}

// with parameters (String type), return value (Int type)
var hello = { (paraName: String) -> (Int) in
    // ...
}

// Closure as parameter
func grabLunch(search: () -> ()) {
  search()  
}
// Call function
grabLunch(search: {
   print("Alfredo's Pizza: 2 miles away")
})

// Autoclosure: call method without {}
func display(greet: @autoclosure () -> ()) {}
display(greet: print("Hello World!"))
```

## CLASS

```swift
import Foundation   //Simple Pakage

// Define
class Question {
    
    // Property
    let answer : Bool
    let questionText : String
    var num1: Int = 0   // Default value

    // computed property
    var sum1: Int {
        num1 + 1
    }

    // Getter, Setter
    var sum2: Int {
        get {
            num1 + 2
        }
    
        // set new value to num1
        set(modify) {and 
            num1 = (modify + 10)
        }
    }

    // static property 
    static var name: String = "" // Using: Question.name
    
    // Constructor
    init() { }
    init(text : String, correctAnswer : Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }

    // Constructor call Constructor
    convenience init() {
        self.init(text: "nghia", correctAnswer: 2)
    }

    // Constructor return null
    init?() {
        if (0 == 0)
            return nil
        // code
    }
    // Using
    /*var quest = Question()
    if (quest != nil) { }
    else { }*/


    // Method
    func doSomething(person: String) -> String {
        return "Hello, " + person + "!"
    }

    // Static method
    static func add() { } // Using: Question.add()

    // Destructor
    deinit { }
}

// USING
let question = Question(text: "Are you ok?", correctAnswer: true)   // init
var saySomething = question.doSomething(person: "nghĩa à")      // Function
question.questionText // "Are you ok?"

// Inherit
class Question2: Question {

    // override method
    override func doSomething(person: String) -> String {
        //...
    }   
}

// Call parent class
super.

// Call this class
self.
```

### Access level

```swift
public //	accessible from everywhere 
private // accessible only within the defined class or struct
fileprivate // accessible only within the current swift file
internal //	accessible only within the defined module (default)

// Example
class Vehicle {
  public var legCount: Int = 0
  private func method2() { }
}
```

### Protocols: abstract class (Blueprint class)

```swift
// Define
protocol Greet {

  // blueprint of a property 
  var name: String { get }

  // blueprint of a method 
  func message() 
}    

// Implement class
class Employee: Greet {

  // implementation of property
  var name = "Perry"

  // implementation of method
  func message() {
    print("Good Morning!")
  }
}

// Multiple implement
class Employee: Greet1, Greet2 { }

// Protocol implement protocol
protocol Brand: Car { }
```

### Structs

```swift
// Define
struct Bike {
    // Properties, function Sample Class
}

// Cannot inherit
// Data struture simple
// A lot of Properties
// Store data simple

// === Struct vs Class ===
var bike1 = Bike(color: "Blue")
var bike2 = bike1
// Struct: copy value
// Class: copy reference

bike1.color = "Red"
print(bike2.color)
// Struct Bike: print "Blue"
// Class Bike: print "Red"
```

### Singleton: only one class instance on project

```swift
// Create Singleton class
class FileManager{
  // create a singleton
  static let fileObj = FileManager()
}

// Using
let file = FileManager.fileObj
```

## PACKAGE/ NAMESPACE
## IMPORT

## EXCEPTION

### Throwing Exception

```swift
// Create Extend Error
enum DivisionError: Error {
  case dividedByZero
}
// Throwing in function
func division() throws {
  //...
  throw DivisionError.dividedByZero
}
```

### Try Catch

```swift
do {
  try division()
  print("Valid Division")
}
catch DivisionError.dividedByZero {
  print("Error: Denominator cannot be 0")
}

// Disable error handling
try! division()
```

## IMPRESSION

### Generic type

```swift
// Generic Function (Type T)
func displayData<T>(data: T) { }

// Using
displayData(data: 5) 
displayData(data: "Swift")

// Generic Class
struct Stack<Element> {
    var items: [Element] = []
    func push(item: Element) { }
    func pop() -> Element { }
}

// Constraint Type
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) { }
```

### Extention class, protocol

```swift
// Extension class
class Temperature { }
extension Temperature {
  // add new methods
} 

// Extentions protocol
protocol Brake {
  func applyBrake()
}
extension Brake {
  func stop() {
    print("Engine Stopped")
  }
}
```

### Typealias: create new type from exist type

```swift
typealias CompletionHandler = (Int)->(String)
```

### Hashable class: compare 2 object by hashValue

```swift
// Create struct
struct Employee: Hashable {
  var name: String

  // Only compare by "name" property
  //func hash(into hasher: inout Hasher) { 
  //  hasher.combine(name)
  //}
}

let object1 = Employee(name: "Sabby")
let object2 = Employee(name: "Sabby")
let object3 = Employee(name: "Smith")

object1.hashValue == object2.hashValue // true
object1.hashValue == object3.hashValue // false
```

### Equatable struct: compare 2 object

```swift
// conform Employee to Equatable
struct Employee: Equatable {   
  var name: String
  var salary: Int

  // Only compare by "salary" property
  //static func == (lhs: Employee, rhs: Employee) -> Bool {
   // return lhs.salary == rhs.salary 
  //}
}

// initialize two objects with different property values 
let obj1 = Employee(name: "Sabby", salary: 40000)
let obj2 = Employee(name: "Sabby", salary: 40000)
let obj3 = Employee(name: "Cathy", salary: 30000)

obj1 == obj2 // true
obj1 == obj3  // false
```

### Weak Reference: release object without all preference release

```swift
class Gadget {
  // When object Gadget release memory (=nil), no need "owner" = nil
  weak var owner: Person?

  // Same with weak, but must be init value
  unowned var owner: Person
  init(owner: Person) {
      self.owner = owner
  }
}
```

---

## REPERENCE

- https://www.programiz.com/swift-programming