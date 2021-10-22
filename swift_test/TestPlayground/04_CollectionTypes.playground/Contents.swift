import UIKit

// 宣告Array
var someInts: [Int] = []
someInts.append(3)
print(someInts[0])
someInts = []
print(type(of: someInts))

// 放入指定數量及值至Array
var someDoubles = Array(repeating: 0.0, count: 3)
var someDoubles2 = Array(repeating: 5.5, count: 2)
var totalDoubles = someDoubles + someDoubles2

// Check Empty
func checkEmpty (_ val:Array<Any> ) {
    if val.isEmpty {
        print("Empty!")
    } else {
        print("No Empty!")
    }
}

// Empty
checkEmpty(someInts)
// No Empty
checkEmpty(totalDoubles)

// 宣告Array
var someStrings: [String] = ["test1", "test2"]
someStrings.append("test3")
someStrings += ["test4"]
someStrings += ["test5", "test6"]
// 使用range查看對應資料
someStrings[4...5] = ["test55", "test66"]
for i in 0...5 {
    print(someStrings[i])
}

func printArray(_ val: Array<Any>) {
    if val.isEmpty {
        return
    }
        
    print("*****************************")
    for (i, row) in val.enumerated() {
        print("Item \(i): \(row)")
    }
    print("*****************************")
}

// 新增值至指定位置 insert(String ,at:Int)
someStrings.insert("test7", at: 0)
printArray(someStrings)

// 移除指定位置 remove(at:Int)
someStrings.remove(at: 0)
printArray(someStrings)
printArray([])

// 宣告集合，相同型別且沒有順序、沒有重複的值
var setString: Set<String> = ["Test1", "Test2", "Test3", "Test2"]
setString.insert("Test4")

if let testRemove = setString.remove("Test2") {
    print("\(testRemove)")
    setString
}
if setString.contains("Test4") {
    print("Success!")
    print("*****************************")
}

for row in setString {
    print(row)
}
print("*****************************")
// 排序
for row in setString.sorted() {
    print(row)
}
print("*****************************")

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let anotherDigits: Set = [3, 4, 8, 9]

// 兩個Set中所有的值
oddDigits.union(evenDigits).sorted()
// 兩個Set中個別都包含的值
oddDigits.intersection(evenDigits).sorted()
// 僅有oddDigits有的值，且不包含交集的值
oddDigits.subtracting(anotherDigits).sorted()
// 兩個Set中不包含交集的值
oddDigits.symmetricDifference(anotherDigits).sorted()

let placeA: Set = ["a", "b"]
let placeB: Set = ["a", "b", "c", "d", "e"]
let placeC: Set = ["f", "g"]

// 確認一個集合的所有值是否都包含在指定集合中
placeA.isSubset(of: placeB)
// 確認一個集合是否包含指定集合的所有值
placeB.isSuperset(of: placeA)
// 確認兩個集合是否沒有交集
placeB.isDisjoint(with: placeC)

// 宣告Dictionary，每個值都有一個唯一key值
var someDictionary: [Int : String] = [:]
print(someDictionary)

var someStringDictionary: [String : String] = ["A": "test", "B": "test2", "C": "test3"]
someStringDictionary["A"]
someStringDictionary["A"] = "QQ"

// 指定key修改value
if let oldVal = someStringDictionary.updateValue("QOO", forKey: "A") {
    print(oldVal)
    print(someStringDictionary["A"] ?? "")
}

// 指定key刪除value
if let removeVal = someStringDictionary.removeValue(forKey: "A") {
    print(removeVal)
//    print(someStringDictionar["A"])
}

for (val1, val2) in someStringDictionary {
    print("\(val1): \(val2)")
}
print("*****************************")

for val in someStringDictionary.keys {
    print("Key: \(val)")
}
print("*****************************")

for val in someStringDictionary.values {
    print("Description: \(val)")
}
print("*****************************")

// 僅顯示key
let someStringCodes = [String](someStringDictionary.keys)
print(someStringCodes)
// 僅顯示value
let someStringNames = [String](someStringDictionary.values)
print(someStringNames)


