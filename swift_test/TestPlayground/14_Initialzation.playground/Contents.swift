import UIKit

/**
 Initialzation
 生成一個類別、結構或列舉的實體時進行初始化的過程
 */

// 初始化程序
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit.")

// 默認屬性值
struct Fahrenheit2 {
    var temperature = 32.0
}

// 自定義初始化
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0).temperatureInCelsius
print("Boiling point: \(boilingPointOfWater)")
let freezingPointOfWater = Celsius(fromKelvin: 273.15).temperatureInCelsius
print("freezing point: \(freezingPointOfWater)")

// 參數名稱和參數標籤
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double){
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let helfGray = Color(white: 0.5)

// 沒有參數標籤的初始化參數
let bodtTemperature = Celsius(37.0).temperatureInCelsius

// 可選的屬性類型
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let chessQuestion = SurveyQuestion(text: "Do you like cheese?")
chessQuestion.ask()
chessQuestion.response = "No"
print(chessQuestion.response ?? "")

// 默認初始化程序
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
print("Name: \(item.name ?? ""), Quantity: \(item.quantity), Purchased: \(item.purchased ? "Y" : "N")")

// 結構類型初始化
struct Size {
    var width = 0.0, height = 0.0
}
let rectangle = Size(width: 2.0, height: 0.0)
print(rectangle.width, rectangle.height)
let rectangle2 = Size(height: 2.0)
print(rectangle2.width, rectangle2.height)
let rectangle3 = Size()
print(rectangle3.width, rectangle3.height)

// 直類型初始化委託
struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    init() { }
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
print("""
========================
Basic Rect
Point: \(basicRect.origin.x), \(basicRect.origin.y)
Size: \(basicRect.size.width), \(basicRect.size.height)
========================
""")
let originRect = Rect(origin: Point(x: 2.0, y: 1.0), size: Size(width: 4.0, height: 5.0))
print("""
========================
Origin Rect
Point: \(originRect.origin.x), \(originRect.origin.y)
Size: \(originRect.size.width), \(originRect.size.height)
========================
""")
let centerRect = Rect(origin: Point(x: 2.0, y: 1.0), size: Size(width: 4.0, height: 5.0))
print("""
========================
Center Rect
Point: \(centerRect.origin.x), \(centerRect.origin.y)
Size: \(centerRect.size.width), \(centerRect.size.height)
========================
""")

// 初始化繼承和覆蓋
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
let vehicle = Vehicle()
print("Vegicle: \(vehicle.description)")

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle {
    var color: String
    init(color: String) {
        self.color = color
    }
    
    override var description: String {
        return "\(super.description) in a beautiful \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
print("===========================")

// 指定和便利初始化程序
class Food {
    var name: String
    init(name: String) {
        print("Begin Food init name: \(name)")
        self.name = name
        print("End Food init name: \(name)")
    }
    convenience init() {
        print("Begin Food conveniect init: [Unnamed]")
        self.init(name: "[Unnamed]")
        print("End Food conveniect init: [Unnamed]")
    }
}
let namedMeat = Food(name: "Bacon")
namedMeat.name
print("===========================")
let mysteryMeat = Food()
mysteryMeat.name
print("===========================")

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        print("Begin RecipeIngredient init name: \(name), quantity: \(quantity)")
        self.quantity = quantity
        super.init(name: name)
        print("End RecipeIngredient init name: \(name), quantity: \(quantity)")
    }
    override convenience init(name: String) {
        print("Begin RecipeIngredient convenience init name: \(name)")
        self.init(name: name, quantity: 1)
        print("End RecipeIngredient convenience init name: \(name)")
    }
}
let oneMysteryItem = RecipeIngredient()
print(oneMysteryItem.name, oneMysteryItem.quantity)
print("===========================")
let oneBacon = RecipeIngredient(name: "Bacon")
print(oneBacon.name, oneBacon.quantity)
print("===========================")
let sitEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print(sitEggs.name, sitEggs.quantity)
print("===========================")

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✓" : " ✗"
        return output
    }
}
var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
print("===========================")

// 可失敗的初始化程序
let wholeNumber: Double = 12345.0
let pi: Double = 3.14159

// init(exactly) 初始化程序，若失敗給予nil
if let valueMaintained = Int(exactly: wholeNumber) {
    print("\(wholeNumber) conversion to Int maintains value of \(valueMaintained)")
}
let valueChanged = Int(exactly: pi)
if valueChanged == nil {
    print("\(pi) conversion to Int doesn't maintain value")
}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe)")
}
let anonymousCreature = Animal(species: "")
if anonymousCreature == nil {
    print("Conldn't be initialized")
}

// 列舉可失敗初始化氣
enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}
let fahrengeitUnit = TemperatureUnit(symbol: "F")
if fahrengeitUnit != nil {
    print("Initialization succeeded.")
}
let unknowUnit = TemperatureUnit(symbol: "X")
if unknowUnit == nil {
    print("Initialization failed.")
}

// 初始化的傳播
class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
if let zeroShirts = CartItem(name: "Shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize.")
}
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize.")
}

// 覆蓋可失敗的初始化程序
class Document {
    var name: String?
    init() { }
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
let documentUnnamed = Document(name: "")
print("Document Name: \(documentUnnamed?.name ?? "[Unitled]")")

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Unitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Unitled]"
        } else {
            self.name = name
        }
    }
}
let automaticallyNamedDocument = AutomaticallyNamedDocument(name: "")
print("Document Name: \(automaticallyNamedDocument.name ?? "")")

class UnitkedDocument: Document {
    override init() {
        super.init(name: "[Unitled]")!
    }
}
let unitkedDocument = UnitkedDocument()
print("Document Name: \(unitkedDocument.name ?? "")")

// 必須的初始化程序
// 表示所有繼承該類別的子類別，都必須實作
class someClass {
    required init() {
        
    }
}
// 繼承類別的子類別，前面同樣需要加上required（不需要override）
class SubSomeClass: someClass {
    required init() {
        
    }
}


// 使用閉包或函數設值默認屬性值
// 西洋棋棋盤
struct Chessboard {
    let boardColors: [[Bool]] = {
        var temporaryBoard: [[Bool]] = [[Bool]]()
        var temporaryRow: [Bool] = []
        var isBlack = false
        for i in 0...7 {
            for j in 0...7 {
                temporaryRow.append(isBlack)
                isBlack = !isBlack
            }
            temporaryBoard.append(temporaryRow)
            isBlack = !isBlack
            temporaryRow = []
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[row][column]
    }
}

let board = Chessboard()
print(board.boardColors)
print(board.squareIsBlackAt(row: 0, column: 1))
print(board.squareIsBlackAt(row: 7, column: 7))

class A {
    var name: String = "Test A"
}

class B: A {
    override init() {
        super.init()
        name = "Test B"
    }
}
class C: B {
    override init() {
        super.init()
        name = "Test C"
    }
    
}
class D: C {
    override init() {
        super.init()
        name = "Test D"
    }
    
}
var TestA = A()
var TestB = B()
var TestC = C()
var TestD = D()
TestA.name
TestB.name
TestC.name
TestD.name

