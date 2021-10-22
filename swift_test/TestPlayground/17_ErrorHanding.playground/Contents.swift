import UIKit

/**
 錯誤處理
 Swift 提供完整的對於錯誤的拋出、捕獲、傳遞及處理的支持。
 */

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
// 拋出錯誤
//throw VendingMachineError.insufficientFunds(coinsNeeded: 10)

// 宣告Item 價格、數量
struct Item {
    var price: Int
    var count: Int
}
// 宣告販賣機，有的物品
class VendingMachine {
    var inventory = [
        "Apple": Item(price: 5, count: 0),
        "Banana": Item(price: 2, count: 40),
        "Cocos": Item(price: 10, count: 8),
        "Pineapple": Item(price: 1, count: 10)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

// 每個人喜歡的水果
let favoriteFruit = [
    "Alice": "Apple",
    "Mini": "Banana",
    "John": "Cheer",
    "Bob": "Pineapple"
]
// 買水果
func buyFavoriteFruit(person: String, vendingMachine: VendingMachine) throws {
    let fruitName = favoriteFruit[person] ?? "Cocos"
    try vendingMachine.vend(itemNamed: fruitName)
}
// 已購買的水果
struct PurchasedFruit {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

// Do-Catch 處理器
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 1
do {
    try buyFavoriteFruit(person: "Bob", vendingMachine: vendingMachine)
    // Error: outOfStock
    //try buyFavoriteFruit(person: "Alice", vendingMachine: vendingMachine)
    // Error: insufficientFunds
    //try buyFavoriteFruit(person: "Mini", vendingMachine: vendingMachine)
    // Error: invalidSelection
    //try buyFavoriteFruit(person: "John", vendingMachine: vendingMachine)
    print("Success!")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insuffucuent funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error)")
}

func nourish(with item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print("Couldn't buy that from the vending machine.")
    }
}

do {
    try nourish(with: "Beef")
} catch {
    print("Error: \(error)")
}

func eat(item: String) throws {
    do {
        try vendingMachine.vend(itemNamed: item)
    } catch VendingMachineError.outOfStock, VendingMachineError.insufficientFunds {
        print("Out of stock, or not enough momey.")
    }
}
do {
    try eat(item: "Beef")
} catch {
    print("Error: \(error)")
}

// 轉換錯誤為可選值
func someThrowingFunction() throws -> Int {
    return 0
}

var x: Int?
do{
    //x = try someThrowingFunction(test: 0)
} catch {
    x = nil
}

// 當錯誤被拋出時，會回傳nil
//let y = try? someThrowingFunction()
// 禁用錯誤傳遞: 當錯誤被拋出時，會發生程式運行時錯誤
//let z = try! someThrowingFunction()

// deger定義一個程式區塊，無論拋出錯誤、return、break結束這個函式後，必定會執行這個程式區塊
func someMethod() throws {
    print("Step 1")
    defer {
        // 釋放資源記憶體或清理工作
        print("defer")
    }
    do {
        try someThrowingFunction()
        print("Step 2")
    } catch {
        print("Error: \(error)")
    }
}
try someMethod()
