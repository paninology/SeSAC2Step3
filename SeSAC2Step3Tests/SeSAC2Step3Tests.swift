//
//  SeSAC2Step3Tests.swift
//  SeSAC2Step3Tests
//
//  Created by yongseok lee on 2022/11/29.
//

import XCTest
@testable import SeSAC2Step3

final class SeSAC2Step3Tests: XCTestCase {
    //유닛테스트는 빨라야댐
    //F.I.R.S.T fast, isolated, Repeatable, self-validating, Timely
    
    var sut: LoginViewController! // system under test 테스트를 하고자 하는 클래스를 정의 할 때 사용.

    override func setUpWithError() throws {
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController
        sut.loadViewIfNeeded() //스토리보드 및 @IBOutlet 시에 필요.
    }

    override func tearDownWithError() throws {
        
        sut = nil //뷰 초기화 해줘야 에러 안남
    }

    //이메일 유효성 테스트
    //TDD - Arrange, Acr, Assert
    //BDD - Given, When, Then
    func testLoginViewController_validEmail_returnTrue() throws {
        //테스트 객체: Given, Arrange
        sut.emailTextField.text = "lee@lee.com"
        //테스트 조건/행동: when, Act
        let valid = sut.isValidEmail()
        //테스트 결과 : Then, Assert
        XCTAssertTrue(valid) //테스트 성공
    }
    
    func testLoginViewController_inValidPassword_ReturnFalse() throws {
        
        sut.passwordTextField.text = "1234"
        
        let valid = sut.isValidPassword()
        
        XCTAssertFalse(valid)
    }
    
    func testLoginViewController_emailtextField_returnNil() throws {
        sut.emailTextField = nil
        let value = sut.emailTextField
        XCTAssertNil(value)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}



