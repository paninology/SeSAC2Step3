//
//  APIServiceTests.swift
//  SeSAC2Step3Tests
//
//  Created by yongseok lee on 2022/12/01.
//

import XCTest
@testable import SeSAC2Step3

final class APIServiceTests: XCTestCase {
    
    var sut: APIService!

    override func setUpWithError() throws {
        sut = APIService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        print("testExampl Start")
        
        sut.number = 100
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("callRequest")
        }
        print("test end")
    }

    //비동기: expectation, fulfill, wait
    /*
     네트워크: 아이폰네트워크 응답x, API 서버 정검, API 지연...?
     효율적/속도/같은 조건에서 테스트 해야하는데 그 조건 깨짐.
     테스트 대상이 외부격리x -> 예측 불가능한 상황을 만들면 안된다.
     => 실제 네트워크 동작이 되는 것 처럼 보이게 별개의 객체를 만듬!
     => 테스트 더블(Test Double) : 테스트 코드랑 상호작용 할 수 있는 가짜 객체 생성(like 스턴트맨)
        ex. dummy, mock, fake, stub, spy...
     */
    func test_APILottoResponse_AsyncCover() throws {
        print("testExampl Start")
        let promise = expectation(description: "waiting Lotto number, completion handler invoked")
      
        sut.number = 33
        
        sut.callRequest { value in
            XCTAssertLessThanOrEqual(value, 45)
            XCTAssertGreaterThanOrEqual(value, 1)
            print("callRequest")
            promise.fulfill() //expectation으로 정의된 테스트 조건을 충족!
        }
        print("test end")
        
        wait(for: [promise], timeout: 5)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
