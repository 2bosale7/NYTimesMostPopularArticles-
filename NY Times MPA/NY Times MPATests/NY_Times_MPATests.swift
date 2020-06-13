//
//  NY_Times_MPATests.swift
//  NY Times MPATests
//
//  Created by Mohammed Saleh on 6/13/20.
//  Copyright © 2020 me. All rights reserved.
//

import XCTest
@testable import NYTimesMPA

class NY_Times_MPATests: XCTestCase {

    let mostPA = MostPopularArticlesPresenter()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMostPopularAericlesApi() {
        MostPopularArticlesPresenter().mostPopularArticles(onSuccess: { (articles) in
            XCTAssert(!articles.isEmpty, "Failing to call api")
        }) { (error) in
            XCTAssert(error != nil, "Failing to call api")
        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
