//
//  ViewController.swift
//  ExReefactorUsingProtocol
//
//  Created by 김종권 on 2024/01/04.
//

import UIKit

protocol LogModelable {
    mutating func addCount()
    func recordToDisk()
}

// 삭제
//struct LogModel: LogModelable {
//    private var countOfTap = 0
//    private var latestDate: Date?
//
//    mutating func addCount() {
//        countOfTap += 1
//        latestDate = .init()
//    }
//
//    func recordToDisk() {
//        let recordString = "countOfTap: \(countOfTap), latestDate: \(latestDate ?? .init())"
//        print("disk에 데이터 저장:", recordString)
//    }
//}

struct LogModel: LogModelable {
    private var countOfTap = 0
    private var latestDate: Date?

    mutating func addCount() {
        print("new!")
        // ...
    }

    func recordToDisk() {
        print("new!")
        // ...
    }
}

class VC1: UIViewController {
    var logModel: LogModelable = LogModel() // <-
    @objc private func tap() {
        logModel.addCount()
    }
    
    deinit {
        logModel.recordToDisk()
    }
}

class VC2: UIViewController {
    var logModel: LogModelable = LogModel() // <-
    @objc private func tap() {
        logModel.addCount()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        logModel.recordToDisk()
    }
}
