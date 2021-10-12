import UIKit

var testDictionary = ["Test1": 1, "Test2": 2, "Test3": 3]

for (name, index) in testDictionary {
    print("Name: \(name), Index: \(index)")
}

for i in 1...5 {
    print("\(i) plus 1 is \(i + 1)")
}

let a = 5
let b = 7
var ans = 10
for _ in a...b {
    ans *= a
    print("a:\(a) b:\(b) answer:\(ans)")
}

let minutes = 60
for val in stride(from: 0, to: minutes, by: 1) {
    print(val)
}

for val in stride(from: 12, through: minutes, by: 12) {
    print(val)
}

let finalSquare = 25
var intArrayRepeating = [Int](repeating: 1, count: finalSquare + 1)
var storgeArray: [Int] = []

var square = 0
var diceRoll = 0
while square < finalSquare {
    diceRoll += 1
    if diceRoll == 5 {
        diceRoll = 1
    }
    square += diceRoll
    storgeArray.append(square)
    if square < intArrayRepeating.count {
        square += intArrayRepeating[square]
    }
    print(square)
    print(intArrayRepeating)
}
print(storgeArray)
print("end")

square = 0
diceRoll = 0
 repeat{
    diceRoll += 1
    if diceRoll == 5 {
        diceRoll = 1
    }
    square += diceRoll
    storgeArray.append(square)
    if square < intArrayRepeating.count {
        square += intArrayRepeating[square]
    }
    print(square)
    print(intArrayRepeating)
} while square < finalSquare
print(storgeArray)
print("end")


let someFruit: String = "banana"
switch someFruit {
case "apple":
    print("This is apple.")
case "banana":
    print("\"GuGuGaGa\" mini said")
default:
    print("Another fruit.")
}


let testInt = Int.random(in: 0...1001)
let resultString: String
switch testInt {
case 0:
    resultString = "0"
case 1..<10:
    resultString = "1 to 9"
case 10..<100:
    resultString = "10 to 99"
case 101...1000:
    resultString = "101 to 1000"
default:
    resultString = "Surprise!"
}
print("\(resultString): \(testInt) \n")


let somePoint = (Int.random(in: -5...5), Int.random(in: -5...5))
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the orgin")
case (_, 0): // case (let x, 0)
    print("\(somePoint) is on the x-axis")
case (0, _): // case (0, let y)
    print("\(somePoint) is on the y-axis")
case (-3...3, -3...3): // case let(x, y)
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

switch somePoint {
case let (x, y) where x == y:
    print("(\(x), \(y)): x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)): x == -y")
case let (x, y):
    print("(\(x), \(y))")
}

let someString = "Hello, bro."
var tmpString = ""
let containString: [Character] = ["l", "b", ".", " "]
for val in someString {
    if containString.contains(val) {
        continue
    }
    tmpString.append(val)
}
print(tmpString)

struct info: Codable {
    var name: String
    var location: String
    
    init() {
        name = "Wei Fu"
        location = "Taiwan"
    }
}

func toGym(info: [String : String]) {
    guard let name = info["name"] else {
        print("Who are you?")
        return
    }
    print("Hi! \(name)")
    
    guard info["location"] != nil else {
        print("Somewhere")
        return
    }
    print("The gym from \(info["location"] ?? "")")
}
toGym(info: ["name": "WeiFu"])
toGym(info: ["location": "Taiwan"])
toGym(info: ["name": "WeiFu", "location": "Taiwan"])
