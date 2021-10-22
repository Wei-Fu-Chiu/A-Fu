import UIKit

let names = ["2testOne", "1testTwo", "3testThree", "4testFour"]
var numbers1: [Int] = [1, 1000, 145, 322, 244]

func backNum(_ n1: Int, _ n2: Int) -> Bool {
    print("\(n1), \(n2)")
    return n1 > n2
}

print(names.sorted())
print(numbers1.sorted(by: backNum))
print(numbers1.sorted(by: >))
print(names)
var test1: [Int] = numbers1.sorted()
test1

numbers1.sort()
print(numbers1)
numbers1.sort(by: backNum)

func backward(_ s1: String, _ s2: String) -> Bool {
    print("\(s1), \(s2)")
    return s1 > s2
}

names.sorted(by: backward)

// 閉包表達式
names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

names.sorted(by: { s1, s2 in return s1 > s2 })

// 單表達式閉包隱式
names.sorted(by: { s1, s2 in s1 > s2 })

// 簡寫速記參數
names.sorted(by: { $0 > $1 })

// 運算符表達式
names.sorted(by: >)

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [43, 23, 1423, 12345]

// 尾隨閉包
let strings = numbers.map{ (val) -> String in
    var number = val
    var output = ""
    // 後測式迴圈
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
print(strings)


func makeIncrementer(forIncrement  amount: Int) -> () -> Int {
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


