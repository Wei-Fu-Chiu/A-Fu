import UIKit


func testPrintString(info: String) -> String {
    let test = "test: \(info)"
    return test
}
print(testPrintString(info: "test123"))

func saySomething () -> String{
    return "Hello, Hi!"
}
print(saySomething())

func testPrintString2(info: String, isOk: Bool) -> String{
    if isOk {
        return saySomething()
    } else {
        return testPrintString(info: info)
    }
}

func minMax(values: [Int]) -> (min: Int, max: Int)? {
    if values.isEmpty { return nil }
    
    var currentMin = values[0]
    var currentMax = values[0]
    for val in values {
        if val < currentMin {
            currentMin = val
        } else if val > currentMax {
            currentMax = val
        }
    }
    return (currentMin, currentMax)
}

func randomInt8ToInt() -> Int {
    return Int(Int8.random(in: Int8.min...Int8.max))
}

if let intArray = minMax(values: [randomInt8ToInt(), randomInt8ToInt(), randomInt8ToInt(), randomInt8ToInt(), randomInt8ToInt()]) {
    print("Min: \(intArray.min), Max: \(intArray.max)")
}

func someFunction(_ intParameter: Int, stringParameter: String,_ doubleParamter: Double, defaultParameter: Int = 123) -> String {
    return """
            ***************************************
            First Parameter: \(intParameter),
            Second parameter: \(stringParameter),
            Third parameter: \(doubleParamter),
            Default parameter: \(defaultParameter)
            ***************************************
            \n
            """
}
print(someFunction(3, stringParameter: "test", 2.0))
print(someFunction(3, stringParameter: "test", 2.0, defaultParameter: 0))

func doubleFunction(_ nums: Double... ) -> Double {
    var total: Double = 0
    for num in nums {
        total += num
    }
    return total / Double(nums.count)
}
doubleFunction(1, 2, 3, 5, 7)
doubleFunction(22.75, 10.5, 5.5)


func swapFunction(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var test1 = 5, test2: Int = 2
print("test1: \(test1), test2: \(test2)")
swapFunction(&test1, &test2)
print("test1: \(test1), test2: \(test2)")


func plusCalculator(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func timesCalculator(_ a: Int, _ b: Int) -> Int {
    return a * b
}


var testCalculator: (Int, Int) -> Int = plusCalculator
print("Plus func: \(testCalculator(5, 6))")
testCalculator = timesCalculator
print("Times func: \(testCalculator(2, 9))")


var currentValue = 10
func chooseFunction(_ chooseCal: Bool) -> (Int, Int) -> Int {
    return chooseCal ? plusCalculator(_:_:) : timesCalculator(_:_:)
}
testCalculator = chooseFunction(true)
currentValue = testCalculator(currentValue, 10)
