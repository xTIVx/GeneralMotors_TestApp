//
//  SearchViewModelTests.swift
//  GeneralMotors_Test_AppTests
//
//  Created by Igor Chernobai on 7/12/21.
//

import XCTest

@testable import GeneralMotors_Test_App


class SearchViewModelTests: XCTestCase {

    var sut: SearchViewModel?


    override func setUpWithError() throws {
        sut = SearchViewModel()

    }

    override func tearDownWithError() throws {
        sut = nil
    }


    func testFetchArtistData() {
        let expectation = expectation(description: "DataRecieved")
        sut?.fetchArtistData(artist: "Sandra", completion: { artistsArray in
            expectation.fulfill()

            XCTAssertNotNil(artistsArray)
        })
        wait(for: [expectation], timeout: 5)
    }

    func testFetchArtistDataWithEmptySearchText() {
        let expectation = expectation(description: "DataRecieved")
        sut?.fetchArtistData(artist: "", completion: { artistsArray in
            expectation.fulfill()

            XCTAssertNil(artistsArray, "❌ artistsArray can not be nil")
        })
        wait(for: [expectation], timeout: 5)
    }

    func testgetArtistDataForCell() {
        guard let sut = sut else {return}
        let testModel = Results(artistName: "", trackName: "", releaseDate: "", primaryGenreName: "", trackPrice: 1.0)
        sut.tracksData = [testModel]

        XCTAssertNotNil(sut.getArtistDataForCell(for:0))
    }

    func testClearData() {
        guard let sut = sut else {return}
        let testModel = Results(artistName: "", trackName: "", releaseDate: "", primaryGenreName: "", trackPrice: 1.0)
        sut.tracksData = [testModel]
        sut.clearData()
        XCTAssertNil(sut.tracksData, "❌ tracksData has to be nil!")

    }


}
