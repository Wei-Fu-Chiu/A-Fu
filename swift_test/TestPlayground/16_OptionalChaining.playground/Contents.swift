import UIKit

/**
 可選鏈
 一個可以存取或呼叫屬性、方法及下標的過程
 當前存取或呼叫的目標可能為nil，而多次存取或呼叫可以用點語法將其全部鏈結再一起
 */

class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRoom = 1
}

let Wick = Person()
/**
 可選屬性residence沒有預設值，所以初始化為nil
 若強制解析會發生錯誤
 */
//let roomCount = Wick.residence!.numberOfRoom
if let roomCount = Wick.residence?.numberOfRoom {
    print("Wick's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms")
}

// 將Residence實例分配給wick.residence
Wick.residence = Residence()
if let roomCount = Wick.residence?.numberOfRoom {
    print("Wick's residence has \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms")
}

class Person2 {
    var residence: Residence2?
}
class Residence2: Residence {
    var rooms: [Room] = []
    override init() {
        super.init()
        numberOfRoom = rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of room is \(numberOfRoom)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if let buildingNumber = buildingNumber, let street = street {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

let Mini = Person2()
if let roomCount = Mini.residence?.numberOfRoom {
    print("Mini's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
let someAddress = Address()
someAddress.buildingNumber = "20"
someAddress.street = "Test Road"
// residence未被調用，因而無法調用屬性
Mini.residence?.address = someAddress
// residence未被調用，因而無法調用方法
Mini.residence?.printNumberOfRooms()
// residence未被調用，因而無法調用下標
Mini.residence?[0] = Room(name: "Bathroom")

let miniHouse = Residence2()
miniHouse.rooms.append(Room(name: "Living Room"))
miniHouse.rooms.append(Room(name: "Kitchen"))
Mini.residence = miniHouse

if let secondRoomName = Mini.residence?[1].name {
    print("The Second room name is \(secondRoomName).")
} else {
    print("Unable to retrieve the second room name.")
}

// 鏈結多級鏈結
if let miniStreet = Mini.residence?.address?.street {
    print("Mini's street name is \(miniStreet)")
} else {
    print("Unable to retrieve the address.")
}

let miniAddress = Address()
miniAddress.buildingName = "The Gugugaga"
miniAddress.buildingNumber = "77"
miniAddress.street = "Banana Street"
Mini.residence?.address = miniAddress

if let miniStreet = Mini.residence?.address?.street {
    print("Mini's street name is \(miniStreet)")
} else {
    print("Unable to retrieve the address.")
}

// 鏈結具有可選返回值的方法
if let buildingIdentifier = Mini.residence?.address?.buildingIdentifier() {
    print("Mini's building identifier is \(buildingIdentifier)")
}

if let containsWithBanana = Mini.residence?.address?.buildingIdentifier()?.contains("Banana") {
    if containsWithBanana {
        print("Banana!")
    } else {
        print("No banana...")
    }
}
