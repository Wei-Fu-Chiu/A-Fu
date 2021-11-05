import UIKit

/**
 泛形
 通用代碼、可重用函數和類型，依據定義的要求與任何類型一起使用。
 */

// 泛形解決問題
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 通用函數
// <T>函式定義的佔位型別
// 佔位型別定義後，參數必須為這個<T>型別
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt2 = 3
var anotherInt2 = 107
swapTwoValues(&someInt2, &anotherInt2)
print(someInt2, anotherInt2)
var someString = "Hello"
var anotherString = "World"
swapTwoValues(&someString, &anotherString)
print(someString, anotherString)

// 泛型型別
struct IntStack {
    var items: [Int] = []
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct Stack<T> {
    var items: [T] = []
    mutating func push(_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}
