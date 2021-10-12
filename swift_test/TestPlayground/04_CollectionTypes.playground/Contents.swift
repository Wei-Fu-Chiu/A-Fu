import UIKit

var someInts: [Int] = []
print(someInts.count)
someInts.append(3)
print(someInts[0])
someInts = []
print(type(of: someInts))

var someDoubles = Array(repeating: 0.0, count: 3)
var someDoubles2 = Array(repeating: 5.5, count: 2)
var totalDoubles = someDoubles + someDoubles2

func checkEmpty (_ val:Array<Any> ) {
    if val.isEmpty {
        print("Empty!")
    } else {
        print("No Empty!")
    }
}

checkEmpty(someInts)
checkEmpty(totalDoubles)

var someStrings: [String] = ["test1", "test2"]
someStrings.append("test3")
someStrings += ["test4"]
someStrings += ["test5", "test6"]
//print(someStrings[0])
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

someStrings.insert("test7", at: 0)
printArray(someStrings)

someStrings.remove(at: 0)
printArray(someStrings)
printArray([])

var setString: Set<String> = ["Test1", "Test2", "Test3", "Test2"]
setString.insert("Test4")

if let testRemove = setString.remove("Test2") {
    print("\(testRemove)")
    setString
}
if setString.contains("Test4") {
    print("Success!")
}

for row in setString {
    print(row)
}
for row in setString.sorted() {
    print(row)
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let anotherDigits: Set = [3, 4, 8, 9]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits).sorted()
oddDigits.subtracting(anotherDigits).sorted()
oddDigits.symmetricDifference(anotherDigits).sorted()

let placeA: Set = ["a", "b"]
let placeB: Set = ["a", "b", "c", "d", "e"]
let placeC: Set = ["f", "g"]

placeA.isSubset(of: placeB)
placeB.isSuperset(of: placeA)
placeB.isDisjoint(with: placeC)

var someDictionary: [Int : String] = [:]
print(someDictionary)

var someStringDictionary: [String : String] = ["A": "test", "B": "test2", "C": "test3"]
someStringDictionary["A"]
someStringDictionary["A"] = "QQ"

if let oldVal = someStringDictionary.updateValue("QOO", forKey: "A") {
    print(oldVal)
    print(someStringDictionary["A"] ?? "")
}

if let removeVal = someStringDictionary.removeValue(forKey: "A") {
    print(removeVal)
//    print(someStringDictionar["A"])
}

for (val1, val2) in someStringDictionary {
    print("\(val1): \(val2)")
}

for val in someStringDictionary.keys {
    print("Key: \(val)")
}

for val in someStringDictionary.values {
    print("Description: \(val)")
}

let someStringCodes = [String](someStringDictionary.keys)
let someStringNames = [String](someStringDictionary.values)

print(someStringCodes)
print(someStringNames)

