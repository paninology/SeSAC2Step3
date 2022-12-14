//
//  ValidationTest.swift
//  SeSAC2Step3Tests
//
//  Created by yongseok lee on 2022/11/30.
//

import XCTest
@testable import SeSAC2Step3

final class ValidationTest: XCTestCase {

    var sut: Validator!
    
    override func setUpWithError() throws {
        sut = Validator()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    //빨리, 독립(다른 테스트에 영향 주면 안된다.), 항상 같은 결과(Repeatable). =>
    //네트워크 비동기 테스트? 서버가 꺼졌을때는?
    func testValidator_validEmail_returnTrue() throws {
        
        let user = User(email: "lee@lee.com", password: "1234", check: "1234")
        let valid = sut.isValidEmail(email: user.email)
        XCTAssertTrue(valid)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
