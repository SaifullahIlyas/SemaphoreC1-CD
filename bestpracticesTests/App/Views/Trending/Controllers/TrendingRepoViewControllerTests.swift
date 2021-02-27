//
//  TrendingRepoViewControllerTests.swift
//  bestpracticesTests
//
//  Created by SAIF ULLAH on 27/02/2021.
//

import XCTest
@testable import bestpractices
import SkeletonView

class TrendingRepoViewControllerTests: XCTestCase {

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
    
    func testOutlestSetupForVC(){
        let vc = TrendingReposVC()
        vc.loadView()
        XCTAssert(vc.tableView != nil)
    }
    func testTableViewHaveOneSection(){
        let vc = TrendingReposVC()
        vc.loadView()
        XCTAssert(vc.tableView?.numberOfSections == 1)
    }
    func testtableViewConformsToDelegate() {
      let vc = TrendingReposVC()
        vc.loadView()
        XCTAssert(vc.tableView?.delegate != nil)
    }
    func testtableViewConformToDataSource() {
        let vc = TrendingReposVC()
        vc.loadView()
        XCTAssert(vc.tableView?.dataSource != nil)
    }
    func testTableViewHaveReuseableCell() {
     let vc = TrendingReposVC()
        vc.loadView()
        let cell = vc.tableView(vc.tableView!, cellForRowAt: IndexPath(row: 0, section: 0)) as? TrendingReposTableViewCell
                let actualReuseIdentifer = cell?.reuseIdentifier
                let expectedReuseIdentifier = "TrendingReposTableViewCell"
                XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
