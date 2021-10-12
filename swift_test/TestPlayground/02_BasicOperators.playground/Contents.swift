import UIKit

let b = 10
var a = 5
a = b
print(a)

let (x, y) = (1, 2)
let xx: Int = 2, yy = 3
print("\(xx), \(yy)")

if x == y {
    print("Success")
}

10 % 3

let calculator = Double(32 / (40 * 8.0)) + Double(10.0 / 4.0)

let four = 4
let minusFour = -four
let plusFour = -minusFour

let minusSeven = -7
let alsoMinusSeven = +minusSeven

a = 1
a += 99

1 == 1
0 != 1
0 < 1
1 > 0
1 >= 1
1 <= 0


(1, "panda") < (2, "abcde")
(3, "banana") < (3, "mini")
(4, "gogoro") == (4, "gogoro")


let Height = 190
var hasHair = false
var Weight: Int
if hasHair {
    Weight = Height / 2
} else {
    Weight = Height / 3
}

let defaultColor = "gray"
var userDefinedColor: String?
var colorToUse = userDefinedColor ?? defaultColor


for i in 1..<10 {
    print("\(i) time 10 is \(i * 2)")
}


let names = ["Joan", "Steven", "Joy", "John Wick"]
for i in 0..<names.count {
    print("Person \(i + 1) is called \(names[i])")
}

for name in names {
    print("First loop script: \(name)")
}

for name in names[...2] {
    print("Second loop script: \(name)")
}

for name in names[2...] {
    print("Third loop script: \(name)")
}


let range = 0...10
range.contains(0)
range.contains(11)
range.contains(-11)
range.contains(-99)


var badGuy = true
var weapon = false
var isPolice = true
if (!badGuy && !weapon) || isPolice {
    print("Hello")
} else {
    print("Get out")
}

var testSttring: String?

testSttring = nil
print(testSttring ?? "")
