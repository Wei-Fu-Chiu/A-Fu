import UIKit

/**
 嵌套類型
 創建列舉以支持特定累或結構功能。
 */
struct BlackjackCard {
    enum Suit: Character {
        case spades = "♠️", hearts = "♥️", dimionds = "♦️", clubs = "♣️"
    }
    
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue)"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .ace, suit: .spades)
print("The ace of spades: \(theAceOfSpades.description)")

// 引用嵌套類型
let heartsSymbol = BlackjackCard.Suit.hearts.rawValue
