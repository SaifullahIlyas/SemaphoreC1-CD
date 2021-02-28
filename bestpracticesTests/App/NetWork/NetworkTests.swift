//
//  NetworkTests.swift
//  bestpracticesTests
//
//  Created by SAIF ULLAH on 28/02/2021.
//

import XCTest
@testable import bestpractices

class NetworkTests: XCTestCase {
    
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
    func testValidUrl() {
        if Constants.baseUrl.isEmpty {
            XCTAssertThrowsError("Base Url Should not be empty")
        }
        let promise = expectation(description: "Status Code Exist")
        Networking(baseURL: Constants.baseUrl, configuration: .ephemeral, cache: .none).get("", completion: {result in
            switch result {
            case .failure(_):
                XCTFail("Base Url Not Exist")
            case .success(_):
                promise.fulfill()
            }
            
            
        })
        
        wait(for: [promise], timeout: 10)
    }
    func testValidRepoRequest() {
        let request = Constants.baseUrl + EndPoints.getAllRepos.description
        XCTAssert(request.trimmingCharacters(in: .whitespaces) == "https://api.github.com/search/repositories?q=language=+sort:stars")
        
        
    }
    
    func testGetAllRepos() {
        let promise = expectation(description: "Status Code Success")
        Networking(baseURL: Constants.baseUrl, configuration: .ephemeral, cache: .none).get(EndPoints.getAllRepos.description, completion: {result in
            switch result {
            case .failure(_):
                XCTFail("Some Thing Went Wrong While Requesting Netwok")
            case .success(_):
                promise.fulfill()
            }
            
            
        })
        
        wait(for: [promise], timeout: 10)
        
    }
    func  testParseJson(){
        
        let promise = expectation(description: "Status Code Success")
        Networking(baseURL: Constants.baseUrl, configuration: .ephemeral, cache: .none).get(EndPoints.getAllRepos.description, completion: {result in
            switch result {
            case .failure(_):
                XCTFail("Some Thing Went Wrong While Requesting Netwok")
            case .success(let response):
                let resp =  try? JSONDecoder().decode(TrendingReposResponse.self, from: response.data)
                promise.fulfill()
                guard resp != nil && resp?.items?.count ?? 0 > 0 else {
                    return  XCTFail("FAIL")
                }
                
                
                
                
            }
            
            
        })
        
        wait(for: [promise], timeout: 10)
    }
    
    
    
}
