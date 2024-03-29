//
//  LoadingErrorViewTests.swift
//  bestpracticesTests
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import XCTest
@testable import bestpractices

class LoadingErrorViewTests: XCTestCase {

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
    //MARK:- Test To check if storyboard outlets have properly connectioned
    func testOutletSetup(){
        let errorView = RepoLodingErrorView(frame: UIScreen.main.bounds)
        XCTAssert(errorView.retryBtn != nil && errorView.container != nil && errorView.animationView != nil)
    }
    //MARK:- Test to check if lottie have file to play for Loading Error View Test
    func testLottieAnimationViewHasAnimation() {
        let errorView = RepoLodingErrorView(frame: UIScreen.main.bounds)
        XCTAssert(errorView.animationView?.animation != nil)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
