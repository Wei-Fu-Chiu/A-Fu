import UIKit
import Darwin

func printInfo (_ val: Any) {
    let t = type(of: val)
    print("\(val) of type \(t)")
}

let DeclaringContants = 10
var Variables = 0

print("Declaring Contants: DeclaringContants = " + String(DeclaringContants))

var x = 0.0, y = 0.0, z = 0.0
//printInfo(x)

var welcomeMessage: String
welcomeMessage = "Hello"
printInfo(welcomeMessage)

var red, green, blue: Double

let π = 3.14159
let 你好 = "你好"
let 🐶🐮 = "dogcow"
print("π = \(π) 你好 = \(你好) \n 🐶🐮 = \(🐶🐮)")

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

// This is a comment
/* This is also acomment
but is written over multiple lines. */
/* This is the start of the first multline comment.
 /* This is the second, nested multiline comment.*/
This is the end of the first multiline comment. */

let minValue = UInt8.min
let maxValue = UInt8.max
let minInt32Value = Int32.min
let maxInt32Value = Int32.max
let minInt64Value = Int64.min
let maxInt64Value = Int64.max

let meaningOfLife = 42
let pi = 3.14159
let anotgerPi = 3 + 0.14159

let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexdecimalInteger = 0x11

let decimalExponent = 1.25e2
let decimalExponent2 = 1.25e-2

let hexadecimalExponent = 0xFp2
let hexadecimalExponent2 = 0xFp-2

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let peddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThonsand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThonsand + UInt16(one)

let three = 3
let pointOneFourOneFiveNime = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNime

