//
//  CurrencyAPITests.swift
//  CurrencyAPITests
//
//  Created by Bhuman Soni on 19/4/20.
//  Copyright © 2020 Bhuman Soni. All rights reserved.
//

import XCTest

class CurrencyAPITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCurrencyOnlyFetch() {
        let ratesAPI = APIFactory.getCurrencyAPI(type: .API_EX_RATE) as! APIDotExRate
        let expect = expectation(description: "Query manual parsing API")
        ratesAPI.fetchExchangeRates(baseCur: "AUD") { (currencies, error, date) in
            XCTAssertNotNil(currencies)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }
    
    func testFullDataFetch() {
        let ratesAPI = APIFactory.getCurrencyAPI(type: .API_EX_RATE)!
        let expect = expectation(description: "We expect data from the callback")
        ratesAPI.fetchAllExRateData(baseCur: "AUD"){ (data, error) in
            XCTAssertNotNil(data)
            XCTAssertEqual(data?.base!, "AUD")
            XCTAssertNotNil(data?.timeLastUpdated, "It should always have the time last updated")
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }
    
    func testBaseExRateIsOne() {
        let ratesAPI = APIFactory.getCurrencyAPI(type: .API_EX_RATE)!
        let expect = expectation(description: "We expect the base AUD to be 1 in list of ex rates")
        let baseCur = "AUD"
        ratesAPI.fetchAllExRateData(baseCur: baseCur){ (data, error) in
            XCTAssertNotNil(data?.rates)
            let exRate = data?.rates![baseCur]
            XCTAssertEqual(exRate, 1)
            expect.fulfill()
        }
        wait(for: [expect], timeout: 5)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
