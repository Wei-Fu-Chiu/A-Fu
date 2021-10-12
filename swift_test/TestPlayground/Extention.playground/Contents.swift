import UIKit

extension Date{
    func between_years(_ toDate: Date?) -> Int {
        if toDate == nil { return 0 }
        
        let compontents = Calendar.current.dateComponents([.day], from: self, to: toDate!)
        let days = compontents.day
        let result: Int = Int((Double(days!) / 365).rounded())
        
        return result
    }
}

extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
