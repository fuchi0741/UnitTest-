//
//  Section3Tests.swift
//  TestCodeSampleTests
//
//  Created by 渕一真 on 2021/04/30.
//

import XCTest
@testable import TestCodeSample

class Section3Tests: XCTestCase {
    
    // パスワードバリデーションのテスト対象コード
    /*
     仕様
     8文字以上であること
     数字が2つ以上使用されていること
     それ以外はNG
     */
    func test_バリデーション_数字が2文字かつ合計の文字数が7つ_falseが返される() {
        let pass = "abcde12"
        let num =  pass.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let result = Section3.validate(password: pass)
        
        XCTAssertEqual(pass.count, 7)
        XCTAssertEqual(num.count, 2)
        
        XCTAssertFalse(result)
    }
    
    func test_バリデーション_数字が2文字かつ合計の文字数が9つ_trueが返される() {
        let pass = "abcdefg12"
        let num =  pass.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let result = Section3.validate(password: pass)
        
        XCTAssertEqual(pass.count, 9)
        XCTAssertEqual(num.count, 2)
        
        XCTAssertTrue(result)
    }
    
    func test_バリデーション_数字が1文字かつ合計の文字数が8つ_falseが返される() {
        let pass = "abcdefg1"
        let num =  pass.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let result = Section3.validate(password: pass)
        
        XCTAssertEqual(pass.count, 8)
        XCTAssertEqual(num.count, 1)
        
        XCTAssertFalse(result)
    }
    
    func test_非同期処理() {
        //非同期処理の待機と完了を表現するためのインスタンス
        let expection = XCTestExpectation(description: "Async String")
        
        Section3.asyncString { string in
            XCTAssertEqual(string, "テキストテキストテキスト")
            expection.fulfill() //期待処理が完了した
        }
        
        //expectionインスタンスを10秒以内にfulfillされるかどうかでテストの合否を判断
        wait(for: [expection], timeout: 10.0)
    }
    
    func test_例外処理_0で割った場合() {
        XCTAssertThrowsError(try Section3.divide(3, by: 0)) { error in
            let error = error as? Section3.OperationError
            XCTAssertEqual(error, Section3.OperationError.divisionByZero)
        }
        
    }
    
    func test_正常系_例外処理含むメソッド() {
        let value = try? Section3.divide(9, by: 3)
        XCTAssertEqual(value, 3)
    }
}
