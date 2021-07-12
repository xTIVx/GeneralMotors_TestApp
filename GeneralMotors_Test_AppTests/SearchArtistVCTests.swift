//
//  GeneralMotors_Test_AppTests.swift
//  GeneralMotors_Test_AppTests
//
//  Created by Igor Chernobai on 7/12/21.
//

import XCTest

@testable import GeneralMotors_Test_App

class SearchArtistVCTests: XCTestCase {

    var sut: SearchArtistVC?

    override func setUpWithError() throws {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: String(describing: "SearchVC"))
        sut = vc as? SearchArtistVC
        sut?.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
    }


    func testSetupTableView() {
        sut?.setupTableView()
        XCTAssertNotNil(sut?.tView.dequeueReusableCell(withIdentifier: "cell"))
    }


}
