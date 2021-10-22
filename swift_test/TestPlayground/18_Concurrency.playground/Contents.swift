import UIKit
import Foundation

/**
 並發
 Swift內置支持以結構化方式編寫異步和並行代碼。
 Async 異步: 一個方法屬性，明確表示一個方法執行異步工作
 Await 等待: 用於調用異步方法的關鍵字。
 */

func listPhotos(inGallery name: String) async -> [String] {
    await Task.sleep(1 * 1_000_000_000)
    await Task.sleep(1 * 1_000_000_000)
    print(name)
    return ["IMG001", "IMG002", "IMG003"]
}

/**
 Actor
 引用類型，與類不同一次只允許一個任務訪問其可變狀態。
 提供封裝良好的資料隔離，確保併發程式碼安全
 */
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}
extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

Task {
    let photoNames = await listPhotos(inGallery: "Test")
    print(photoNames)
    
    // 異步序列: 一次等待集合的一個元素
    let handle = FileHandle.standardInput
    for try await line in handle.bytes.lines {
        print(line)
    }
    
    // 任務群組
    await withTaskGroup(of: [String].self) { taskGroup in
        let photoNames = await listPhotos(inGallery: "test")
        for name in photoNames {
            taskGroup.addTask { await listPhotos(inGallery: name) }
        }
    }

    print("test")
//    let logger = TemperatureLogger(label: "Outdoors", measurement: 10)
//    print(await logger.update(with: 10))
}
