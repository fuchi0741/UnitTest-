//
//  Section3.swift
//  TestCodeSample
//
//  Created by 渕一真 on 2021/04/30.
//

import Foundation



class Section3 {
    //バリデーションのテスト
    static func validate(password: String) -> Bool {
        if password.count <= 7 {
            return false
        }
        
        let numString = password.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return numString.count >= 2
    }
    
    //非同期処理
    static func asyncString(completion: ((String) -> Void)?) {
        DispatchQueue.global().async {
            sleep(3)
            
            completion?("テキストテキストテキスト")
        }
    }
    
    //例外処理
    enum OperationError: Error {
        case divisionByZero
    }
    
    static func divide(_ x: Int, by y: Int) throws -> Int {
        if y == 0 {
            throw OperationError.divisionByZero
        }
        
        return x / y
    }
}
