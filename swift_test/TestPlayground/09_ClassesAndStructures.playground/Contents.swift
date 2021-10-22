import UIKit
import CoreFoundation

/*
 class & struct 共通點
 1. 定義：
  (1). 屬性儲存值 var value: Any
  (2). 提供功能的方法 func
  (3). 初始值設定 init()
 2. 擴展性
 */

// 定義 Struct
struct testStruct {
    var test1 = 0
    var test2 = 0
}

// 定義 Class
class testClass {
    var test3 = testStruct()
    var test4 = false
    var test5 = 0.0
    var test6: String?
}

let someStruct = testStruct()
let someClass = testClass()

print("Test structure 1: \(someStruct.test1)")
print("Test1 of someClass: \(someClass.test3.test1)")

someClass.test3.test1 = 999
print("Test 3: \(someClass.test3.test1)")

var someStruct2 = testStruct(test1: 123, test2: 321)
var someStruct3 = someStruct2
someStruct3.test1 = 999

// Struct 賦予當前值儲存於新的實例中，結果為同數值的兩個獨立實例
print("The test 1 of someStruct 2 is \(someStruct2.test1)")
print("The test 1 of someStruct 3 is \(someStruct3.test1)")

enum testEnumberation {
    case test1, test2, test3, test4
    
    // 當自己改變值需使用mutating修飾
    mutating func turnTestInit() {
        self = .test1
    }
}

var someTestUnit = testEnumberation.test4
var tmpTestUnit = someTestUnit
someTestUnit.turnTestInit()

print("Test Unit: \(someTestUnit)")
print("Template Test Unit: \(tmpTestUnit)")

// 因繼承緣故值被取代
let someClass2 = testClass()
someClass2.test3 = someStruct
someClass2.test4 = true
someClass2.test5 = 12.3
someClass2.test6 = nil

let someClass3 = someClass2
someClass3.test6 = "TEST WOWOWOWO"

print("""
      someClass2.test6: \(someClass2.test6 ?? "")
      someClass3.test6: \(someClass3.test6 ?? "")
      """)

if someClass2 === someClass3 {
    print("Same")
}
