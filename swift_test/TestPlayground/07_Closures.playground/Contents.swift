import UIKit

let names = ["1testOne", "2testTwo", "3testThree", "4testFour"]

print(names.sorted())

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

names.sorted(by: backward)

names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

names.sorted(by: { s1, s2 in return s1 > s2 })

names.sorted(by: { s1, s2 in s1 > s2 })

names.sorted(by: { $0 > $1 })

names.sorted(by: >)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [43, 23, 1423, 12345]

let strings = numbers.map{ (val) -> String in
    var number = val
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)


func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

makeIncrementer(forIncrement: 20)
print(makeIncrementer(forIncrement: 20))

var test = makeIncrementer(forIncrement: 20)
print(test())
print(test())
print(test())

var test2 = makeIncrementer(forIncrement: 10)
print(test2())
print(test2())
print(test2())
