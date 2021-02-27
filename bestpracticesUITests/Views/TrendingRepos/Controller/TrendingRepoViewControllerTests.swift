//
//  TrendingRepoViewControllerTests.swift
//  bestpracticesUITests
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import XCTest
//@testable import bestpractices

class TrendingRepoViewControllerTests: XCTestCase {
let tableIdentifier = "repoTable"
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    
    func testcontrollerNavigation(){
        let app = XCUIApplication()
        XCTAssert(app.navigationBars["Trending"].exists)
        XCTAssert(app.navigationBars.buttons["menuright"].exists)
    }
    func testControllerHasReposTable () {
        let app = XCUIApplication()
        XCTAssert(app.tables.matching(identifier: "repoTable").element.firstMatch.exists)
    }
    func testRepoTableHaveErrorView() {
        let app = XCUIApplication()
        XCTAssert(app.otherElements["Error"].waitForExistence(timeout: 5))
        
    }
    func testRepoTableHaveCellsForShimmer() {
        
        let app = XCUIApplication()
        XCTAssert(app.tables[tableIdentifier].cells.count > 0)
        
    }
    func testRepoTableHaveRepoDetailCell() {
        
        let app = XCUIApplication()
        XCTAssert(app.tables[tableIdentifier].cells.matching(identifier: "RepoDetailCell").firstMatch.exists)
        
                
                        
    }
}
