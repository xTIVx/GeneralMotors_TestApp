//
//  APIHandlerTests.swift
//  GeneralMotors_Test_AppTests
//
//  Created by Igor Chernobai on 7/12/21.
//

import XCTest

@testable import GeneralMotors_Test_App

class APIHandlerTests: XCTestCase {

    var sut: APIHandler?
    
    override func setUpWithError() throws {
        sut = APIHandler()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchArtists() {
        guard let sut = sut else {return}
        let expectation = expectation(description: "DataRecieved")

        sut.fetchArtists(by: "Sandra") { result in
            expectation.fulfill()
            XCTAssertNotNil(result)
        }
        wait(for: [expectation], timeout: 5)
    }

    func testFetchArtistsWrongURL() {
        guard let sut = sut else {return}
        let expectation = expectation(description: "DataRecieved")

        sut.fetchArtists(by: "^") { result in
            expectation.fulfill()
            XCTAssertNil(result)
        }
        wait(for: [expectation], timeout: 5)
    }

    func testDecodeData() {
        XCTAssertNil(sut?.decodeData(data: Data()))
    }
    

}
