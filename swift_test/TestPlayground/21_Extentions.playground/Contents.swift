import UIKit

/**
 擴展向現有的所有類、結構、列舉或協議添加新功能
 1. 添加計算實例屬性和計算類型屬性
 2. 定義實例方法和類型方法
 3. 提供新的初始化程序
 4. 定義下標
 5. 定義和使用新的嵌套類型
 6. 使現有類型符合協議
 */

// 計算屬性
extension Double {
    var km: Double { return self * 1_000.0}
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}
let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
let aMarathon = 42.km + 105.m
print("A marathon is \(aMarathon) meters long")

// 初始化程序
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 1.0, y: 1.0), size: Size(width: 4.0, height: 4.0))
print("memberwiseRect's origin is (\(memberwiseRect.origin.x), \(memberwiseRect.origin.y)) and its size is (\(memberwiseRect.size.width), \(memberwiseRect.size.height))")

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
print("CenterRect's origin is (\(centerRect.origin.x), \(centerRect.origin.y)) and its size is (\(centerRect.size.width), \(centerRect.size.height))")

// 方法
extension Int {
    func repetitions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
3.repetitions {
    print("WOW")
}
// 變異實例方法
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()

// 下標
extension Int {
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self/decimalBase) % 10
    }
}
12345679[0]
12345679[2]
12345679[4]
12345679[6]
12345679[9]

// 嵌套類型
extension Int {
    enum Kind {
        case negative, zero, positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

func pritIntegerKind(_ number: [Int]) {
    for number in number {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

pritIntegerKind([3, 10, -23, 0, -4, 0, 23])
