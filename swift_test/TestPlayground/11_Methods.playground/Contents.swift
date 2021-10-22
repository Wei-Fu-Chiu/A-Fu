import UIKit

// 實體方法: 需要先生成一個實體，才可以使用方法
class counter {
    var result = 0
    
    func increment() {
        // self 可忽略
        self.result += 1
        print("Amount: \(result)")
    }
    
    func increment(by amount: Int) {
        result += amount
        print("Amount: \(result)")
    }
    
    func subtraction(by amount: Int) {
        result -= amount
        print("Amount: \(result)")
    }
    
    func reset() {
        result = 0
        print("Amount: \(result)")
    }
}

var calculator = counter()
calculator.increment()
calculator.increment(by: 100)
calculator.subtraction(by: 50)
calculator.increment(by: 100)
calculator.reset()


struct testSelf {
    var test1 = 0, test2 = 0
    func isSelf(test1: Int) -> Bool {
        return self.test1 > test1
    }
    
    mutating func valueChange(test1 a: Int, test2 b: Int) {
        test1 = a
        test2 = b
    }
    
    mutating func valueChange2(test1 a: Int, test2 b: Int) {
        self = testSelf(test1: a, test2: b)
    }
}
var checkSelf = testSelf(test1: 15, test2: 10)
if checkSelf.isSelf(test1: 10) {
    print("Access")
}
print("test1: \(checkSelf.test1), test2: \(checkSelf.test2)")
checkSelf.valueChange(test1: 3, test2: 5)
print("test1: \(checkSelf.test1), test2: \(checkSelf.test2)")
checkSelf.valueChange2(test1: 55, test2: 11)
print("test1: \(checkSelf.test1), test2: \(checkSelf.test2)")


// 型別方法，定義在特定型別上的方法。
class someClass {
    class func someTypeMethod(a: Int) -> Int {
        return a
    }
    static func someTypeMethod2(a: Int) -> Int {
        return a
    }
    class final func someTypeMethod3(a: Int) -> Int {
        return a
    }
}

let testtest = someClass.someTypeMethod(a: 12)
print(testtest)

class someClass2: someClass {
    override class func someTypeMethod(a: Int) -> Int {
        return a + 1
    }
    
    // error: 不可覆蓋靜態方法
//    static func someTypeMethod2(a: Int) -> Int {
//        return a + 1
//    }
    // error: 不可覆蓋final class方法
//    class final func someTypeMethod3(a: Int) -> Int {
//        return a + 1
//    }
}
