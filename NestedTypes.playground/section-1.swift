import UIKit

struct BlackjackCard {
    enum Suit: Character {
        case Spades="S",Hearts="H",Diamonds="D",Clubs="C"
    }
    enum Rank: Int {
        case Two = 2,Three,Four,Five,Six,Seven,Eight,Nine,Ten
        case Jack,Queen,King,Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)

let heartChar = BlackjackCard.Suit.Hearts.rawValue