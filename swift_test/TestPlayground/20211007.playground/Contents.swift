import UIKit

/*
 For loop from 10...1?
 */

// 1...5
for i in stride(from: 5, through: 1, by: -1){
    print(i)
}

// 1..<5
for i in stride(from: 5, to: 1, by: -1) {
    print(i)
}
 
// isEmpty
var emptyString: String = ""
if emptyString.isEmpty {
    print(emptyString)
}

// nilString? = nul, isEmpty僅能判斷字串
var nilString: String?
if (nilString?.isEmpty == nil) {
    print(nilString ?? "")
}

// String
// startIndex is the index of the first character
// endIndex is the index after the last character
let indexString: String = "Test index!"
indexString[indexString.startIndex]
indexString[indexString.index(before: indexString.endIndex)]
indexString[indexString.startIndex..<indexString.endIndex]

// String 加長方式
var testString: String = "Test"
testString += " Test2"
testString.insert(contentsOf: " Test3", at: testString.endIndex)

// Remove string
var rangeIndex = testString.index(testString.startIndex, offsetBy: 10)..<testString.endIndex
testString[rangeIndex]
testString.removeSubrange(rangeIndex)

// Replace string
extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}

let replaceString = "test string!"
replaceString.replace(target: "test", withString: "replace")

/*
    String is structure
    Swift String with Unicode-compliance
 */

testString.append("test")
