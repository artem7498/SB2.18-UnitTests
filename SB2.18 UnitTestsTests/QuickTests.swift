//
//  QuickTests.swift
//  SB2.18 UnitTestsTests
//
//  Created by Артём on 4/29/21.
//

import XCTest
import Quick
import Nimble

@testable import SB2_18_UnitTests

class QuickTests: QuickSpec {
    
    override func spec() {
        describe("ArraySort") {
            it("Performs operations correctly") {
                let arraySort = ArraySort()
                expect(arraySort.arithmetic(array: [6, 4, 4, 6])).to(equal(5))
                expect(arraySort.findMin([6, -44, 1, 6, -1])).to(equal(-44))
//                expect(arraySort.oneString(["54", "A", "-", "53", "B"])).to(equal("54, A, -, 53, B"))
                expect(arraySort.sortFiles(["name2.txt", "name25.txt", "name6.txt"])).to(equal(["name2.txt", "name6.txt", "name25.txt"]))
                let person1 = Employee(name: "Ann", age: 53)
                let person2 = Employee(name: "Bella", age: 12)
                let person3 = Employee(name: "Austin", age: 40)
                expect(arraySort.sortItemsByAge([person1, person2, person3])).to(equal([person2, person3, person1]))
                
            }
        }
    }
    
}
