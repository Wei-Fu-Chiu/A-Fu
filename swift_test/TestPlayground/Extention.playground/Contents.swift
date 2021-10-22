import UIKit
import Foundation

extension Date{
    func between_years(_ toDate: Date) -> Int {
        let compontents = Calendar.current.dateComponents([.day], from: self, to: toDate)
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
"tset".replace(target: <#T##String#>, withString: <#T##String#>)
// Example
let formatter = DateFormatter()
formatter.dateFormat = "yyyy/MM/dd"
let toDate: Date = formatter.date(from: "2001/12/10") ?? Date()
let testYears = toDate.between_years(Date())

let toDate2 = Date(timeIntervalSinceReferenceDate: -240000000)

var dateComponents = DateComponents()
dateComponents.year = 1990
dateComponents.month = 10
dateComponents.day = 31
dateComponents.timeZone = TimeZone(abbreviation: "JST")
dateComponents.hour = 7
dateComponents.minute = 30
let userCalendar = Calendar(identifier: .gregorian)
let toDate3 = userCalendar.date(from: dateComponents)

print("""
    toDate 1: \(toDate)
    toDate 2: \(toDate2)
    toDate 3: \(String(describing: toDate3))
""")
