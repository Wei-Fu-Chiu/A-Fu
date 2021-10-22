import UIKit

/**
 繼承
 主要是類別（class）在使用。
 一個類別可以繼承另一個類別的屬性（property）、方法（method）及其他特性。
 一個類別繼承其他類別時，這個類別被稱為子類別；被繼承的類別稱為父類別（superclass）
 */

class vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        
    }
}

// 子類別
class bicycle: vehicle {
    var hasBasket = false
}
let testBicycle = bicycle()
testBicycle.hasBasket = true
testBicycle.currentSpeed = 10.0
print("Bicycle: \(testBicycle.description)")

// 子類化
class tandem: bicycle {
    var currentNumberOfPassengers = 0
}
let testTandem = tandem()
testTandem.currentSpeed = 20.0
print("Bicycle: \(testTandem.description)")

// 覆蓋方法
class train: vehicle {
    override func makeNoise() {
        print("Choo~~~~Choo~~~~~CHOO!")
    }
}
let testTrain = train()
testTrain.makeNoise()

// 覆蓋屬性
class car: vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let testCar = car()
testCar.currentSpeed = 30.0
testCar.gear = 3
print("Car: \(testCar.description)")

// 覆蓋屬性觀察者
class automaticCar: car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
let testAutomaticCar = automaticCar()
// didSet gear
testAutomaticCar.currentSpeed = 50
print("AutomaticCar: \(testAutomaticCar.description)")

/**
 防止覆蓋
 可以在類別的方法、屬性或下標前面加上final, 如final var、 final func、 final class func
 也可在整個類別加上final
 */
class testOverride {
    var overrideProperty: Int {
        get {
            return 0
        }
        set {
            self.overrideProperty = newValue
        }
    }
    final var someProperty: String = ""
    final func someMethod() {
    }
    final class func someMethod2() {
    }
}

class testOverride2: testOverride {
    var testTest = ""
    // 覆蓋屬性 getter setter
    override var overrideProperty: Int {
        get {
            return 10
        }
        set {
            self.overrideProperty = newValue + 10
        }
    }
}

let testOverride3 = testOverride2()
