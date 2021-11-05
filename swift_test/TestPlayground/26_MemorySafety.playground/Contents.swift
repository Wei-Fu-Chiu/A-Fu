import UIKit

/**
 內存安全
 Swift會自動管理內存
 */

// 寫入一個記憶體位置
var one = 1
// 讀取該記憶體位置
print("\(one)")

/**
 內存訪問三個特徵：
 1. 訪問讀或寫
 2. 訪問的持續時間
 3. 正在訪問的內存位置
 如果有以下兩個條件同時發生，則會發生衝突
 1. 寫入內存或非原子訪問
 2. 訪問內存中的相同位置
 3. 持續時間重疊
 */

func oneMore(than number: Int) -> Int {
    return number + 1
}
var myNumber = 1
myNumber = oneMore(than: myNumber)
print(myNumber)

// 讀訪問stepSize與寫訪問number重疊，且兩者指向相同的內存位置
var stepSize = 1
func increment(_ number: inout Int) {
    number += stepSize
}
//increment(&stepSize)

// 解決衝突方法
var copyOfStepSize = stepSize
increment(&copyOfStepSize)
stepSize = copyOfStepSize

// Error: 嘗試同時對內存同一位置執行兩次寫訪問
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore = 42
var playerTwoScore = 30
//balance(&playerOneScore, &playerOneScore)
// 解決衝突方法
balance(&playerOneScore, &playerTwoScore)

// 方法中self的衝突訪問
struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}
extension Player {
    mutating func shareHealth(with teammate: inout Player) {
        balance(&teammate.health, &health)
    }
}
var oscar = Player(name: "Oscar", health: 10, energy: 10)
var maria = Player(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)
// Error: 相同持續時間內寫訪問，且兩次寫訪問指向同一個內存
//oscar.shareHealth(with: &oscar)

// 對屬性的衝突訪問
var playerInformation = (health: 10, energy: 20)
// Error: 嘗試同時對內存同一位置執行兩次寫訪問
//balance(&playerInformation.health, &playerInformation.energy)

/**
 滿足以下條件，對結構屬性的重疊訪問是安全：
 1. 只訪問實體的存儲屬性，而不是計算屬性或類屬性
 2. 結構是局部變量的值，而不是全局變量
 3. 結構不被任何閉包使用，要馬使用非轉義閉包
 */
extension Array {
    private func someFunction(someClosure: (() -> Int)?) {
        print("step 2")
    }
    
    func someOtherFunction(someOtherClosure: @escaping () -> Int) {
        print("step 1")
        someFunction(someClosure: someOtherClosure)
    }
}

let x = [1, 2, 3]
x.someOtherFunction(someOtherClosure: { return 1 })

// function memory safety
