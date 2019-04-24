import Foundation   //Simple Pakage

class Question {
    
    let answer : Bool
    let questionText : String
    
    // Constructor
    init(text : String, correctAnswer : Bool) {
        questionText = text
        answer = correctAnswer
    }

    // 	Function/ Action
    func doSomething(person: String) -> String {
        return "Hello, " + person + "!"
    }
}


// USING
let question = Question(text: "Are you ok?", correctAnswer: true)
var saySomething = question.doSomething(person: "nghĩa à")  