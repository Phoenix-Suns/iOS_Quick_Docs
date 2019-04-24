// Declaration
let numbers = [1, 3, 5, 7, 9, 11, 13, 15]
var streets = ["Albemarle", "Brandywine", "Chesapeake"]
var emptyDoubles: [Double] = []
var emptyFloats: Array<Float> = Array()
var list = [Question]() //Question = Type of Elements


// Accessing
streets[2] = "new Street"

for street in streets {
    print("street: \(street)")
}

streets.isEmpty
streets.count
streets.first
streets.last
streets.firstIndex(of: "new Street")

// Add, Remove Element
streets.append("Nghia Street")
streets.append(contentsOf: ["NewStreet1", "NewStreet2"])
streets.insert("NewStreet3", at: 4)

streets.remove(at: 2)
streets.removeLast()