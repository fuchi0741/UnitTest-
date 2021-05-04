//
//  Section3_DI.swift
//  TestCodeSample
//
//  Created by 渕一真 on 2021/05/04.
//

import UIKit

//コンストラクタインジェクション
protocol LoggerProtocol {
    func sendLog(message: String)
}

class Section3_DI {
    //コンストラクタインジェクション
    class Logger: LoggerProtocol {
        func sendLog(message: String) {
            // 本番用のログ送信の実装
        }
    }
    
    class DebugLogger: LoggerProtocol {
        func sendLog(message: String) {
            // 開発環境用のログ送信の実装
        }
    }
    
    class Calculator {
        private let logger: LoggerProtocol
        
        //テスト用開発用どちらでも代用が可能。
        init(logger: LoggerProtocol) {
            self.logger = logger
        }
    }
    
    let logger = Logger() //本番用
    let debugLogger = DebugLogger()
    
    lazy var cal = Calculator(logger: debugLogger)
}

//セッターインジェクション
protocol PresenterProtocol {}
class Presenter: PresenterProtocol {}

class HogeViewController: UIViewController {
    private var presenter: PresenterProtocol?
    
    func inject(presenter: PresenterProtocol) {
        self.presenter = presenter
    }
}
