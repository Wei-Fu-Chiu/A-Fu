import UIKit

/**
 協議定義的該適合特定任或功能方法屬性和其他需求。
 類、結構或列舉皆可以採用協議
 */

// 屬性要求
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doecNotNeedToBeSettable: Int { get }
}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "John Wick")
john.fullName

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
print("Full name: \(ncc1701.fullName)")

// 方法要求
protocol SomeFuncProtocol {
    static func someTypeMethod()
}

// 單實例方法要求的協議
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        // truncatingRemainder浮點數取餘數
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")
print("And another one: \(generator.random())")

// 變異方法要求
protocol Toggleable {
    mutating func toggle()
}

enum OnOffSwitch: Toggleable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// 初始化程序要求
protocol SomeProtocol2 {
    init(someParameter: Int)
}

// 初始化值設訂項要求的類實現
class SomeClass: SomeProtocol2 {
    required init(someParameter: Int) {
        
    }
}

// 子類覆蓋來自超類的指定初始化,並且實現協議的匹配初始化要求
protocol SomeProtocol3 {
    init()
}
class SomeSuperClass {
    init() {
        
    }
}
class SomeSubClass: SomeSuperClass, SomeProtocol3 {
    required override init() {
        
    }
}

// 失敗初始化程序要求
protocol SomeFailureProtocol {
    init()
    init?(name: String)
}
class SomeClass2: SomeFailureProtocol {
    var name: String
    required init() {
        name = "test"
    }
    
    required init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}
let testClass = SomeClass2(name: "")?.name

// 類型的協議
/**
 可允許其他類型的地方使用協議
 1. 作為函數、方法或初始值設定項中的參數類型或返回類型
 2. 作為常量、變量或屬性的類型
 3. 作為數組、字典或其他容器中的類型
 */
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}

// 委託
/**
 使類或結構能夠將其職責委託給另一種類型的實例。
 */
protocol DiceGame {
    var dice: Dice { get }
    func play()
}
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class SnakesAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        print(board)
    }
    weak var delgate: DiceGameDelegate?
    func play() {
        square = 0
        delgate?.gameDidStart(self)
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delgate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                print("square: \(square), diceRoll: \(diceRoll)")
                square += board[square]
                print("square: \(square), board: \(board[square])")
            }
        }
        delgate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns = 0
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakesAndLadders {
            print("Started a new game of Snakes and Ladders")
        }
        print("The game is using a \(game.dice.sides)-sided dice")
    }
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakesAndLadders()
game.delgate = tracker
game.play()

// 擴展添加協議一致性
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)

extension SnakesAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)

// 條件式遵守協議
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map{ $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}
let myDice = [d6, d12]
print(myDice.textualDescription)

// 擴展聲明採用協議
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable { }

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)

// 綜合實現的協議
/**
 自動提供一致性的Equatable、Hashable以及Comparable
 */

// 實現 ==
struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
}
let twoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
let anotherTwoThreeFour = Vector3D(x: 2.0, y: 3.0, z: 4.0)
if twoThreeFour == anotherTwoThreeFour {
    print("These two vectors are also equuvalent")
}

// 在集合中使用任何符合協議的類型或字典
struct Hero: Hashable {
    var name: String
    var height: Double
    var gender: String
    
    // 計算hashValue
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(gender)
    }
    
    // == 判斷值是否相等
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name && lhs.gender == rhs.gender
    }
}
let hero1 = Hero(name: "John Wick", height: 195, gender: "Male")
let hero2 = Hero(name: "John Wick", height: 187, gender: "Male")
let hero3 = Hero(name: "John Wick", height: 199, gender: "Female")
let set = Set(arrayLiteral: hero1, hero2, hero3)

// 沒有原始值的列舉提供實現<=, >, >=
enum SkillLevel: Comparable {
    case beginner
    case intermediate
    case expert(stars: Int)
}
var levels = [SkillLevel.intermediate, SkillLevel.beginner, SkillLevel.expert(stars: 5), SkillLevel.expert(stars: 3)]
for level in levels.sorted() {
    print(level)
}

// 協議類型的集合
let things: [TextRepresentable] = [game, d12, simonTheHamster]
for thing in things {
    print(thing.textualDescription)
}

// 協議繼承
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "🔺 "
            case let ladder where ladder < 0:
                output += "🔻 "
            default:
                output += "o "
            }
        }
        return output
    }
}
print(game.prettyTextualDescription)

// 協議組成
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person2: Named, Aged {
    var name: String
    var age: Int
    var gender: String
}
// 需要皆符合協議的類型
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)")
}
let birthdayPerson = Person2(name: "Mamamo", age: 25, gender: "Female")
wishHappyBirthday(to: birthdayPerson)

// 檢查協議一制性
protocol HasArea {
    var area: Double { get }
}
class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}
class Country: HasArea {
    var area: Double
    init(area: Double) { self.area = area }
}

if Circle(radius: 2.0) is HasArea {
    print("Same")
}
Circle(radius: 2.0) is Country

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}
let objects: [AnyObject] = [
    Circle(radius: 2.0),
    Country(area: 243_610),
    Animal(legs: 4)
]
for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

// 可選協議要求
// 可選要求必須用@objc屬性標記
@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
            print("Amount: \(amount) count: \(count)")
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
            print("Amount: \(amount), count: \(count)")
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement: Int = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}

class TowardsZeroSource: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            print("Toward: == 0, Count: \(count)")
            return 0
        } else if count < 0 {
            print("Toward: < 0, Count: \(count)")
            return 1
        } else {
            print("Toward: -1, Count: \(count)")
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

// 協議擴展
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        let randomValue = random()
        print(randomValue)
        print(randomValue)
        return randomValue > 0.5
    }
}
let generator2 = LinearCongruentialGenerator()
print("Here's a random number: \(generator2.random())")
print("Here's a random Boolean: \(generator2.randomBool())")

// 提供默認實現
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
class TestDefault: PrettyTextRepresentable {
    var textualDescription: String {
        return "Hello."
    }
}
let testDefault = TestDefault()
testDefault.prettyTextualDescription

// 向協議擴展添加約束
extension Collection where Element: Equatable {
    func allEqual() -> Bool {
        for (index, element) in self.enumerated() {
            if element != self.first {
                print(index, element)
                return false
            }
        }
        return true
    }
}
let equalNumbers = [100, 100, 100, 100, 100]
let differentNumbers = [100, 100, 200, 100, 200]
print(equalNumbers.allEqual())
print(differentNumbers.allEqual())

protocol TestProtocol {
    var number: Int { get }
}

protocol TestProtocol2: TestProtocol {
    var name: String { get }
    func testFunc()
}

class TestClass: TestProtocol2 {
    var number: Int = 0
    var name: String = "Hi"
    func testFunc() {
        print("Hello")
    }
}
class TestClass2: TestClass {
    override func testFunc() {
        print("HI")
    }
}

var testClass2 = TestClass2()
testClass2.number = 10
testClass2.number
testClass2.testFunc()
