import UIKit
import CoreFoundation

/*
 1. 下標是一個可以快速存取及設置值的地方
 2. 可以定義在類別（class）、結構（structure）及列舉（enumeration）中
 */
class simpleMath {
    var num = 50
    
    subscript(times: String) -> Int {
        get {
            print(times)
            return num * 2
        }
        set {
            num *= newValue
        }
    }
    
    subscript(divied: Int) -> Int {
        return num / divied
    }
}

// 宣告類別
let oneMath = simpleMath()
// String -> get -> num * 2
print(oneMath["simple"])
// Int -> num / value
print(oneMath[2])
// String -> set -> num * newValue
oneMath["test"] = 5
print(oneMath.num)


struct timesTable {
    let num: Int
    subscript(index: Int) -> Int {
        return num * index
    }
}
let fiveTimesTable = timesTable(num: 5)
print("num: \(fiveTimesTable.num), three times five: \(fiveTimesTable[3])")

/**
 下標選項
 下標可以接受任意數量輸入
 */
struct matrix {
    let rows: Int, columns: Int
    var guid: [Double]
    
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        guid = Array(repeating: 0.0, count: rows * columns)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && columns >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double{
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return guid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            guid[(row * columns) + column] = newValue
        }
    }
}

// init rows & columns & guid
var testMatrix = matrix(rows: 2, columns: 3)
// get matrix
testMatrix[0, 1]
testMatrix[1, 0]
// set matrix
testMatrix[0, 1] = 5.5
testMatrix[1, 0] = 2.2
// get matrix again
testMatrix[0, 1]
testMatrix[1, 0]
// check matrix value
testMatrix.guid
testMatrix.rows
testMatrix.columns

/**
 類型下標
 在特定類型的實例上調用的下標
 */
enum planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(n: Int) -> planet {
        return planet(rawValue: n)!
    }
}
let mars = planet[4]
print(mars)
