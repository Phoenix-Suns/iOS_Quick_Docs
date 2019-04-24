func getMilk() {
    print("nghia")
}

func getMilk(number: Int) -> String {
    return "have \(number) cartons";
}


// USING
getMilk()   //output: nghia
var numberMilk = getMilk(number: 4)  //output: have 4 cartons