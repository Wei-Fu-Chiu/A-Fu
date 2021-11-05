import UIKit

// 不透明類型
/**
 帶有不透明返回類型函數或發法，將會隱藏其返回值的類型。
 不提供具體類型作為函數的返回類型，而是根據協議描述返回值。
 */

protocol Shape {
    func draw() -> String
}
struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result: [String] = []
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n")
    }
}
let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}
let flippedShape = FlippedShape(shape: smallTriangle)
print(flippedShape.draw())

struct JoinedShape<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}
let joinedShape = JoinedShape(top: smallTriangle, bottom: flippedShape)
print(joinedShape.draw())
print("===================")

// 返回不透明類型
struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}
// some 關鍵字表示不透明類型
/**
 不透明類型和協議類型比較
 不透明類型總是指定特定的、具體的類型，但無法得知類型
 協議類型可以指很多類型，只要符合協議
 */
func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}
let trapzoid = makeTrapezoid()
print(trapzoid.draw())
print("===================")
print(type(of: trapzoid))

// 返回類型與泛型結合
func flip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}
func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> Shape {
    JoinedShape(top: top, bottom: bottom)
}
let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))
print(opaqueJoinedTriangles.draw())

// Error: return types don't match
// 因為不透明類型無法得知類型
//func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
//    if shape is Shape {
//        return shape
//    }
//    return FlippedShape(shape: shape)
//}


func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Shape {
        print("Same")
        return shape
    }
    return FlippedShape(shape: shape)
}
let testFlip1 = protoFlip(smallTriangle)
let testFlip2 = protoFlip(smallTriangle)
/**
 協議不包含==運算方法
 */
//testFlip1 == testFlip2

// 關聯類型
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container{ }

// Error: 不能將具有關聯類型的協議作為函數的返回類型
//func makeProtocolContainer<T>(item: T) -> Container {
//    return [item]
//}
// Error: 不能將泛型用作返回類型的約束，因為無法確切知道泛型的類型
//func makeProtocolContainer<T, C: Container>(item: T) -> C {
//    return [item]
//}

func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0]
print(type(of: twelve))
