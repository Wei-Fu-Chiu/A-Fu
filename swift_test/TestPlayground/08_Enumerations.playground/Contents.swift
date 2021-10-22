import UIKit
import Darwin

// 定義列舉
enum someEnumeration {
    case test1
    case test2
    case test3
    case test4
}

// 列舉型別名稱
var testEnumberation = someEnumeration.test1
testEnumberation = .test2

switch testEnumberation {
    case .test1:
        print("This is test 1")
    case .test2:
        print("This is test 2")
    case .test3:
        print("This is test 3")
    case .test4:
        print("This is test 4")
}

let testEnumberation2 = someEnumeration.test4
switch testEnumberation2 {
    case .test2:
        print("This is test 2 2 2")
    default:
        print("Nothings")
}

// enum -> Array
enum beverage: String, CaseIterable {
    enum decodeError: String, Error {
        case missMatchingData = "test"
    }
    
    case coffee
    case tea
    case juice
    case blackTea
    
    var name: String {
        switch self {
        case .coffee:
            return "☕️"
        case .blackTea:
            return "🫖"
        case .juice:
            return "🧃"
        case .tea:
            return "🍵"
        }
    }
    
    init(key: String) throws {
        switch key {
        case "1":
            self = .coffee
        case "2":
            self = .tea
        case "3":
            self = .juice
        case "4":
            self = .blackTea
        default:
            throw decodeError.missMatchingData
        }
    }
    
    var key: String {
        switch self {
        case .coffee:
            return "1"
        case .tea:
            return "2"
        case .juice:
            return "3"
        case .blackTea:
            return "4"
        }
    }
}

for val in beverage.allCases {
    print("\(val): \(val.name)")
}

// 篩選
let testFilter = beverage.allCases.filter({$0 != .coffee})

// 返回序列, 從0開始的連續整數
for (index, val) in testFilter.enumerated() {
    print("Item \(index + 1): \(val.name)")
}

// 依需求可自定義一個或以上其他型別的相關值
enum barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = barcode.upc(4, 12345, 64432, 2)
productBarcode = .qrCode("QWEQWEIOWEQWEASD")

switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .qrCode(let productCode):
        print("QR Code: \(productCode)")
}


enum multipleEnumberation: Int {
    case test1, test2, test3, test4
}
multipleEnumberation.test2.rawValue
let testFind = 4
if let someEnum = multipleEnumberation(rawValue: testFind) {
    switch someEnum {
        case .test2:
            print("This is test 2")
        default:
            print("Nothing")
    }
} else {
    print("These isn't testEnumberation2 at position \(testFind)")
}


indirect enum arithmeticExpression {
    case number(Int)
    // 列舉的實體，indirect是內存佈局
    case addition(arithmeticExpression, arithmeticExpression)
    case multiplication(arithmeticExpression, arithmeticExpression)
}

let test1 = arithmeticExpression.number(99)
let test2 = arithmeticExpression.number(1)
let sum = arithmeticExpression.addition(test1, test2)
let test3 = arithmeticExpression.multiplication(sum, arithmeticExpression.number(101))

func evaluate(_ expression: arithmeticExpression) -> Int {
    switch expression{
        case let .number(value):
            print("value: \(value)")
            return value
        case let .addition(n1, n2):
            print("Addition: n1 =\(n1), n2 = \(n2)")
            return evaluate(n1) + evaluate(n2)
        case let .multiplication(n1, n2):
            print("Multiplication: n1 =\(n1), n2 = \(n2)")
            return evaluate(n1) * evaluate(n2)
    }
}
print(evaluate(test3))
