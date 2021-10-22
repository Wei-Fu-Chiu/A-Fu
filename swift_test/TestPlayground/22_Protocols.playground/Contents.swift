import UIKit

/**
 協議定義的該適合特定任或功能方法屬性和其他需求。
 類、結構或列舉皆可以採用協議
 */

// 屬性要求
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doecNotNeedToBeSettable: Int { get }
}
