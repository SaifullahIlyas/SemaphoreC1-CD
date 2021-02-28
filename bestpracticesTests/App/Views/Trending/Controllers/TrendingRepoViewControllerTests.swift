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

    var vc : TrendingReposVC? = nil
    override func setUpWithError() throws {
        vc = TrendingReposVC()
        vc?.loadView()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    //MARK:- Test To check outlet connection with storyboard For Repo View Controller
    func testOutlestSetupForVC(){
        XCTAssert(vc?.tableView != nil)
    }
    
    //MARK:- Test To check repo table should have one section only
    func testTableViewHaveOneSection(){
        XCTAssert(vc?.tableView?.numberOfSections == 1)
    }
    
    //MARK:- Test To check if tableview conform to delegate
    func testtableViewConformsToDelegate() {
        XCTAssert(vc?.tableView?.delegate != nil)
    }
    //MARK:- Test To check if tableview conform to datasource
    func testtableViewConformToDataSource() {
        XCTAssert(vc?.tableView?.dataSource != nil)
    }
    
    //MARK:- Test to check if tableview has reuseable udentifier for cell in repo view controller
    func testTableViewHaveReuseableCell() {
        let cell = vc?.tableView((vc?.tableView!)!, cellForRowAt: IndexPath(row: 0, section: 0)) as? TrendingReposTableViewCell
                let actualReuseIdentifer = cell?.reuseIdentifier
                let expectedReuseIdentifier = "TrendingReposTableViewCell"
                XCTAssertEqual(actualReuseIdentifer, expectedReuseIdentifier)
    }
    
    //MARK:- Test To check if tableview is skelton able or not to play shimmer effect
    func testTableViewSkeltonAble() {
        guard let skeltonAble = vc?.tableView?.isSkeletonable else {
            return XCTAssertThrowsError("TableView Should be SkeltonAble")
        }
        XCTAssert(skeltonAble)
    }
    
    //MARK:- Test to check if Repo detail cell and all of its subview are skeltonable to play shimmer effect in Tableview
    func testTableCellSketonAble(){
        guard let tablecell = vc?.tableView?.dequeueReusableCell(withIdentifier: "TrendingReposTableViewCell") as? TrendingReposTableViewCell else {
           return XCTAssertThrowsError("Table Should Have Trending Repo Cell")
        }
        
        XCTAssert(tablecell.contentView.subviews.allSatisfy(({$0.isSkeletonable})) && tablecell.isSkeletonable)
    }
    
    //MARK:- Default Performance Test
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
