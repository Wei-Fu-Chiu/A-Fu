import UIKit

// 類型轉換
// 一種檢查實例類型的方法，或者將該實例視為自身類層次結構中的其他地方不同的超類或子類

// 定義類型轉的類層次結構
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Music: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let libaray = [
    Movie(name: "Hello Movie 1", director: "Movie test 1"),
    Movie(name: "Hello Movie 2", director: "Movie test 2"),
    Music(name: "Hello Music 1", artist: "Music test 1"),
    Movie(name: "Hello Movie 3", director: "Movie test 1"),
    Music(name: "Hello Music 2", artist: "Music test 2")
]

// 確認型別
var musicCount = 0
var movieCount = 0

for val in libaray {
    if val is Movie {
        movieCount += 1
    } else if val is Music {
        musicCount += 1
    }
}
print("Movie Count: \(movieCount), Music Count: \(musicCount)")

// 轉換類型運算符，轉換為子類型
for val in libaray {
    if let movie = val as? Movie {
        print("Movie name: \(movie.name), Director: \(movie.director)")
    } else if let music = val as? Music {
        print("Music name: \(music.name), Artist: \(music.artist)")
    }
}

let test1 = 0
let test2: Double = 0.0


if test1 is Int {
    print(test1)
}
/**
 Any 可以表示任何類型的實例，包括函數類型。
 AnyObject 可以表示任何類類型的實例
 */
var thinks: [Any] = []
thinks.append(0)
thinks.append(0.0)
thinks.append(10)
thinks.append(1.2345)
thinks.append(-1.2345)
thinks.append("Hello World")
thinks.append((1.0, 2.0))
thinks.append(Movie(name: "Hello Movie", director: "Test"))
thinks.append({ (name: String) -> String in "Hello, \(name)" })

for val in thinks {
    switch val {
    case 0 as Int:
        print("Zero as an Int")
    case 0.0 as Double:
        print("Zero as a Double")
    case let someInt as Int:
        print("Integer value: \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("Double value: \(someDouble)")
    case is Double:
        print("some other double")
    case let someString as String:
        print("String: \(someString)")
    case let (x, y) as (Double, Double):
        print("x: \(x), y: \(y)")
    case let movie as Movie:
        print("Movie name: \(movie.name), Director: \(movie.director)")
    case let convertString as (String) -> String:
        print("\(convertString("Mini"))")
    default:
        print("something else")
    }
}

class ClassA {
    
}
class ClassB: ClassA {
    
}
let classA = ClassA()
let classB = ClassB()
if classB as ClassA != nil {
    print("Same")
}

if classB is ClassA {
    print("classB is ClassA()")
}

