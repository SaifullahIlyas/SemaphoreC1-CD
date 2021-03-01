//
//  TrendingReposprenterTest.swift
//  bestpracticesTests
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import XCTest
@testable import bestpractices

class TrendingReposPresenterTest: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK:- Test To check if Presenter have api client to call network
    func testApiClientNotNull() {
        let presenter = TrendingReposPresenter(delegate: nil)
        XCTAssert(presenter.client != nil)
    }
}
