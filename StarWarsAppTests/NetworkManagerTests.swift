//
//  NetworkManagerTests.swift
//  StarWarsAppTests
//
//  Created by atme on 13/07/2022.
//

import XCTest

class NetworkManagerTests: XCTestCase {
    
    var networkManager: NetworkManager!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWrongRequest() throws {
        networkManager = NetworkManager()
        let request = WrongRequest()
        let expectation = XCTestExpectation(description: "response")
        networkManager.resumeDataTask(withRequest: request) { result in
            switch result {
            case .success(let data):
                XCTFail("The response should've been successful!")
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription, "A server with the specified hostname could not be found.")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }
    
    func testCorrectRequest() throws {
        networkManager = NetworkManager()
        let request = MovieListRequest()
        let expectation = XCTestExpectation(description: "response")
        networkManager.resumeDataTask(withRequest: request) { result in
            switch result {
            case .success(let data):
                if data.isEmpty {
                    XCTFail("The data should've been empty!")
                }
            case .failure(let error):
                XCTFail("The response should've been failure!")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 10)
    }

}
