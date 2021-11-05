import UIKit

/**
 Module: 一個module可代表一個bundle ID下的app，一個framework。
 一個app可以import很多framework，每一個framework內只有一個module。
 
 Source Files: 每一個.swift檔案。
 
 Access Control可分為5個層級。
 高到低： open / public / internal / file-private / private
 
 open： 用於宣告class以及class內所有的成員，所有的module和source file都可取得，且可subclass和override。
 
 public： 不限於class，所有module和source file都可以取得，但若為class，則不可subclass和override
 
 internal： 宣告的module內的所有source file才可取得，module外無法取得。可subclass和override。
 同時為預設的access control
 
 fileprivate： 宣告的source file內才可取得，若為class，可subclass和override。
 
 private：宣吿的區快內才可取得，也就是{}內才可取得。若為class可subclass和override。
 */
class accessControl {
    fileprivate var fileprivateProperty: String = ""
    private var privateProperty: String = ""
    
    func testFunction() {
        fileprivateProperty = "hello fileprivate"
        privateProperty = "hello private"
        print(privateProperty)
    }
}
extension accessControl {
    func someFunction() {
        fileprivateProperty = "hi"
        // swift 4前無法取得，swift 4開始可以取得
        privateProperty = "hi"
    }
}
var test = accessControl()
test.testFunction()
test.fileprivateProperty

// 以上5層原則，內部成員的層級不能高於最外圍成員
fileprivate class someClass {
    fileprivate var name: String = "hi"
    private var age: Int = 12
    // 不可高於外層
    //open var testOpen: Int = 100
}
fileprivate var test2 = someClass()
//test2.testOpen

public class somePublicClass {
    public var somePublicProperty = 0
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() { }
    private func somePrivateMethod() { }
}

// 隱式判斷internal類別
class SomeInternalClass {
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod() { }
    private func somePrivateMethod() { }
}

fileprivate class SomeFilePrivateClass {
    func someFilePrivateMethod() { }
    private func somePrivateMethod() { }
}

public class SomePrivateClass {
    func somePrivateMethod() { }
}

// 函數的返回類型是私有的，必須使用private修飾
private func somePrivateFunc() -> (SomeInternalClass, SomePrivateClass) {
    let test = SomeInternalClass()
    let test2 = SomePrivateClass()
    return (test, test2)
}
private var testPub = somePrivateFunc()

// 列舉成員的存取層級無法單獨指定不同的存取層級
// Setter存取權限可以設定比Getter嚴格
class Man {
    var name: String = "John"
    private(set) var age = 18
    func getOlder() {
        age = age + 1
    }
}
var man = Man()
man.getOlder()
// 因存取權限為private不可set
//man.age = 30
print(man.age)


// 元組型別
private var description = "Sunday!"
internal var number = 100
public var name = "John"
var someTuple = (description, number, name)

// 子類化
public class A {
    fileprivate var someInt: Int = 123
    fileprivate func someMethod() { }
}

internal class B: A {
    // 可覆寫父類別的方法，更新為更寬鬆的層級
    override internal func someMethod() {
        // 可呼叫存取層級更嚴格的父類成員
        super.someMethod()
        someInt = 2
    }
}
var testA = A()
var testB = B()
testB.someInt
testB.someMethod()
testB.someInt

// Getter Setter
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value += "Hi"
stringToEdit.value += "Hi A"
stringToEdit.value += "Hi B"
print(stringToEdit.numberOfEdits)
