//
//  WeatherAPITests.swift
//  SB2.18 UnitTestsTests
//
//  Created by Артём on 4/30/21.
//

import XCTest
import Quick
import Nimble
import OHHTTPStubs

@testable import SB2_18_UnitTests

class WeatherAPITests: QuickSpec {
    
    let interactor = WeatherInteractor()
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        HTTPStubs.removeAllStubs()
    }
    
    override func spec() {
        stub(condition: isPath(interactor.relativeURL)) { _ in
            guard let path = OHPathForFile("model.json", type(of: self)) else {
                preconditionFailure("Could not find expected file in test bundle")
            }
            return HTTPStubsResponse(fileAtPath: path,
                                                 statusCode: 200,
                                                 headers: ["ContentType" : "aplication/json"]
            )
        }
        
        let e = expectation(description: "Weather")
        interactor.interact { _ in
            let all = self.interactor.weathers
            describe("Weather") {
                it("parses") {
                    expect(all.count).to(equal(1))
                    print(all[0].weather)
                    expect(all[0].weather.count).to(equal(8))
                }
            }
            e.fulfill()
        }
        waitForExpectations(timeout: 1, handler: nil)
    }
}
