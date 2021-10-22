import UIKit

/**
 Deinitialization
 1. 使用deinit關鍵字，類似使用init初始化的方式。
 2. 僅適用class
 
 運作原理
 Swift會將不再需要的實例自動解除分配，以釋放資源，釋放前會先進行解構過程，使用解構器(deinitializer)實作。
 透過處理時實例的儲存管理自動引用計數(ARC)。
 */

class Bank {
    static var coninsInBank = 10_000
    static func distribute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coninsInBank)
        coninsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receive(coins: Int) {
        coninsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.distribute(coins: coins)
    }
    func win(coins: Int) {
        coinsInPurse += Bank.distribute(coins: coins)
    }
    deinit {
        Bank.receive(coins: coinsInPurse)
    }
}

// init distrubute
var playerA: Player? = Player(coins: 100)
print("New player A: \(playerA!.coinsInPurse) coins")
print("Now \(Bank.coninsInBank) coins left in the bank")
playerA!.win(coins: 5_000)
print("PlayerA won 5000 coins & now has \(playerA!.coinsInPurse) coins")
print("The bank now only has \(Bank.coninsInBank) coins left")

// deinit receive
playerA = nil
print("Player A has left the game")
print("The bank now has \(Bank.coninsInBank) coins")
