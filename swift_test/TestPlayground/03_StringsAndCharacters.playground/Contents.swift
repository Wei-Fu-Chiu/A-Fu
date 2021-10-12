import UIKit

var someString = "Good try, woooooo"

let quotation = """
****************************************************
...

The bad guy take weapon, \
killed people.
    "Run!!!!!" I said.
    "Don't move!" Bad guy said.

Other place

\"This wall is more import than knowledge\" - WTH
Take money\u{24}
Business\u{2665}
I love sport\u{1F496}
****************************************************
"""

print(quotation)

let QuotationMarks = #"""
Test: """"""
Test2: \u{1F496}
Test3: \(someString)
****************************************************
"""#
print(QuotationMarks)

var emptyString = ""
var anotherEmptyString = String()
if emptyString.isEmpty {
    print("Nothing.")
    anotherEmptyString = "Empty!"
}
print(anotherEmptyString)

someString += "! What?"

someString = "Test🤪"
for c in someString {
    print(c)
}

let charArray: [Character] = ["T", "e", "s", "t", "!", "😜"]
let charString = String(charArray)
print(charString)

print(#"1 plus 1 is \#(1 + 1)."#)

print("Qyitation has \(quotation.count) characters.")
print(someString[someString.startIndex])
print(someString[someString.index(after: someString.startIndex)])
print(someString[someString.index(before: someString.endIndex)])
print(someString[someString.index(someString.startIndex, offsetBy: 4)])

print(someString.startIndex)
type(of: someString.startIndex)
print(someString.endIndex)

for i in someString.indices {
    print("\(someString[i])", terminator: "!")
}

print("\n**************************************")

someString.insert("!", at: someString.endIndex)
print(someString)
someString.insert(contentsOf: " What wrong", at: someString.index(before: someString.endIndex))
print(someString)

someString.remove(at: someString.index(before: someString.endIndex))
print(someString)

let range = someString.index(someString.endIndex, offsetBy: -11)..<someString.endIndex
someString.removeSubrange(range)
print(someString)

someString = "Test🤪, Test2!"
let index = someString.firstIndex(of: ",") ?? someString.endIndex
print("\(someString[..<index])")

let newString = String(someString[..<index])
print(newString)
print(type(of: range))
print(type(of: newString))

let giroroAndTamama = [
    "Test 1-1: hello, lol",
    "Test 1-2: hi, lol",
    "Test 1-3: bonjour, lol",
    "Test 2-1: wow",
    "Test 2-2: lol",
    "Test 2-3: woooooo, wow",
    "Test 2-4: oops"
]

var totalTest = 0
for row in giroroAndTamama {
    if row.hasPrefix("Test 1") {
        totalTest += 1
    }
}
print("Total test: \(totalTest)")

var testCount = 0
var testCount2 = 0
for row in giroroAndTamama {
    if row.hasSuffix("wow") {
        testCount += 1
    } else if row.hasSuffix("lol") {
        testCount2 += 1
    }
}
print("""
testCount: \(testCount)
testCount2: \(testCount2)
**********************************
""")



var testString: String

testString = "write"

testString += " house"

testString.uppercased()
testString.lowercased()

