import UIKit

struct someTestItem {
    var testValue : Int
    let lenght: Int
}
var testItem1 = someTestItem(testValue: 0, lenght: 10)
testItem1.testValue = 4
print(testItem1.testValue)

class dataImporter {
    // lazy 初始化後，在使用self
    lazy var fileFullName = "\(fileName)\(fileType)"
    var fileName = "data"
    var fileType = ".txt"
}

class dataManager {
    var importer = dataImporter()
    var data: [String] = []
}

let manager = dataManager()
manager.data.append("WOWOWO")
manager.data.append("WOWOWO@@@")
manager.importer.fileFullName
manager.importer.fileName = "TEST"
manager.importer.fileName
manager.importer.fileFullName


struct point {
    var x = 0.0, y = 0.0
}
struct size {
    var width = 0.0, height = 0.0
}
struct rect {
    var origin = point()
    var sizeRange = size()
    var center: point {
        get {
            let centerX = origin.x + (sizeRange.width / 2)
            let centerY = origin.y + (sizeRange.height / 2)
            return point(x: centerX, y: centerY)
        }
        set(newCenter){
            origin.x = newCenter.x - (sizeRange.width / 2)
            origin.y = newCenter.y - (sizeRange.height / 2)
        }
    }
}
var square = rect(sizeRange: size(width: 5.0, height: 5.0))
let initialCenter = square.center
print(initialCenter)
square.center = point(x: 15.0, y: 15.0)
print("\(square.origin.x), \(square.origin.y), \(square.center)")


struct cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var val: Double {
        return width * height * depth
    }
}
let testCuboid = cuboid(width: 10.0, height: 5.0, depth: 3.0)
print("The volumn: \(testCuboid.val)")


class testCounter {
    var totalValue: Int = 0 {
        willSet(val) {
            print("Value will set \(val)")
        }
        didSet {
            if (totalValue > oldValue){
                print("Added \(totalValue - oldValue).")
            }
        }
    }
}

let testCount = testCounter()
testCount.totalValue = 100
testCount.totalValue = 215
testCount.totalValue = 999

// 包裝元素
@propertyWrapper
struct numberOrLess {
    private var number = 0
    var wrappedValue: Int {
        get { return number }
        set { number = min(newValue, 10)}
    }
}

struct testRectangle {
    @numberOrLess var heighr: Int
    @numberOrLess var width: Int
}

var rectangle = testRectangle()
rectangle.width = 12
print(rectangle.width)
rectangle.width = 8
print(rectangle.width)

struct testRectangle2 {
    private var _height = numberOrLess()
    private var _width = numberOrLess()
    var height: Int {
        get { return _height.wrappedValue}
        set { _height.wrappedValue = newValue}
    }
    var width: Int {
        get { return _width.wrappedValue}
        set { _width.wrappedValue = newValue}
    }
}

var rectangle2 = testRectangle2()
rectangle2.width = 12
print(rectangle2.width)
rectangle2.width = 8
print(rectangle2.width)

@propertyWrapper
struct limitMaxNumber {
    private var maximum: Int
    private var number: Int
    
    var wrappedValue: Int {
        get { return number}
        set { number = min(newValue, maximum)}
    }
    
    init() {
        maximum = 10
        number = 0
    }
    
    init(wrappedValue: Int){
        maximum = 10
        number = min(wrappedValue, maximum)
    }
    
    init(wrappedValue: Int, maximum: Int){
        self.maximum = maximum
        number = min(wrappedValue, maximum)
    }
}

struct testRectangle3 {
    @limitMaxNumber var height: Int
    @limitMaxNumber var width: Int
    @limitMaxNumber(wrappedValue: 5, maximum: 7) var height2: Int
    @limitMaxNumber(wrappedValue: 4, maximum: 9) var width2: Int
    @limitMaxNumber(maximum: 3) var height3: Int = 2
    @limitMaxNumber var width3: Int = 3
}

var rectangle3 = testRectangle3()
print(rectangle3.width, rectangle3.height)
rectangle3.width2 = 10
rectangle3.height2 = 9
print(rectangle3.width2, rectangle3.height2)
rectangle3.height3 = 5
print(rectangle3.width3, rectangle3.height3)


@propertyWrapper
struct limitMaxNumber2 {
    private var number: Int
    private(set) var projectValue: Bool
    
    var wrappedValue: Int {
        get { return number}
        set {
            if newValue > 10 {
                number = 10
                projectValue = true
            } else {
                number = newValue
                projectValue = false
            }
        }
    }
    
    init() {
        self.number = 0
        self.projectValue = false
    }
}

enum shapeSize {
    case small, large
}
//struct sizedRectangle {
//    @limitMaxNumber2 var height: Int
//    @limitMaxNumber2 var width: Int
//
//    mutating func resize(to size: shapeSize) -> Bool {
//        switch size {
//            case .small:
//                height = 5
//                width = 10
//            case .large:
//                height = 50
//                width = 100
//        }
//        return $height || $width
//    }
//}
