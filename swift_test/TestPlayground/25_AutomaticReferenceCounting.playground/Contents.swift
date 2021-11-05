import UIKit
import CoreFoundation

/**
 ARC 自動引用技術
 跟蹤和管理內存的使用狀況。
 引用技術僅適用於類的實體。
 結構和列舉是值類型，而不是引用類型，不會透過引用儲存和傳遞。
 */

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) 1 is being initialized")
    }
    deinit {
        print("\(name) 1 is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name:  "John Wick")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
// 直到最後一個被破壞才會被釋放
reference3 = nil

// 強引用
class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) 2 is being deinitialized") }
}
class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person2?
    deinit { print("Apartment2 \(unit) is being deinitialized") }
}
var john: Person2?
var unit4A: Apartment2?

john = Person2(name: "John Haha")
unit4A = Apartment2(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

// 強引用兩者間的實體仍然存在不能被破壞
john = nil
unit4A = nil
//unit4A?.tenant?.name

// 弱引用
class Person3 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment3?
    deinit { print("\(name) 3 is being deinitialized") }
}
class Apartment3 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person3?
    deinit { print("Apartment 3 \(unit) is being deinitialized") }
}
var john2: Person3?
var unit4A2: Apartment3?

john2 = Person3(name: "John Haha")
unit4A2 = Apartment3(unit: "4A")
john2 = nil
unit4A2 = nil

// 無主引用
// 與弱引用不同在於無主引用始終具有值
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String){
        self.name = name
    }
    deinit { print("Customer 4: \(name) is being deinitialized")}
}
class CreditCard {
    let number: UInt64
    weak var customer: Customer?
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card 4 #\(number) is being deinitialized") }
}
var wick: Customer?
wick = Customer(name: "John Wick")
wick!.card = CreditCard(number: 1234_1234_1234_1234, customer: wick!)
wick?.card?.customer?.name

wick = nil

// 無主的可選參考
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
    deinit { print("\(name) 5 is being deinitialized") }
}
class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}

var department: Department? = Department(name: "Horticulture")
let intro = Course(name: "Survey of plants", in: department!)
let intermediate = Course(name: "Growing Common Herbs", in: department!)
let advanced = Course(name: "Caring for Tropical Plants", in: department!)
intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department!.courses = [intro, intermediate, advanced]
department = nil


// 無主引用和隱式展開的可選屬性
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, captitalName: String) {
        self.name = name
        self.capitalCity = City(name: captitalName, country: self)
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
// 無需創建強引用循環，並可以直接訪問屬性
var country = Country(name: "Canada", captitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")


// 關閉強參考週期
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("HTML: \(name) is be deinitialized")
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)<\(heading.name)>"
}
print(heading.asHTML())
// 閉包不會被釋放，因強引用循環
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph!.asHTML())
paragraph = nil


// 解決閉包強引用循環
class HTMLElement2 {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)<\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("HTML 2: \(name) is be deinitialized")
    }
}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "Hello World")
print(paragraph2!.asHTML())
paragraph2 = nil
