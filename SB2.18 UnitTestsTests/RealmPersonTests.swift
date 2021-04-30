//
//  RealmPersonTests.swift
//  SB2.18 UnitTestsTests
//
//  Created by Артём on 4/29/21.
//

import XCTest
import Quick
import Nimble
import RealmSwift

@testable import SB2_18_UnitTests

class RealmPersonTests: QuickSpec {
    
    override func spec() {
        Realm.Configuration.defaultConfiguration.inMemoryIdentifier = self.name
        
        describe("saving data") {
            let realmPersonWork = RealmPersonWork()
            var persons: Results<Person>?
            beforeEach { //не используется в данном случае
                realmPersonWork.save(name: "Ann", height: 185.5, weight: 50, male: "female", birthDate: "22.02.1995")
                realmPersonWork.save(name: "Bob", height: 145.5, weight: 60, male: "male", birthDate: "05.02.1996")
                realmPersonWork.save(name: "Austin", height: 190.5, weight: 92, male: "male", birthDate: "01.02.1995")
                persons = realmPersonWork.getPersons()
                print(persons!)
            }
            
            context("testing"){
                it("sav") {
                    realmPersonWork.save(name: "Sasha", height: 195, weight: 80, male: "male", birthDate: "12.11.2001")
                    expect(persons?.count).to(equal(4))
                    realmPersonWork.delete(index: 1)
                    expect(persons?.count).to(equal(3))
                    let old = realmPersonWork.oldest()
                    expect(old.birthDate).to(equal("01.02.1995"))
                    let young = realmPersonWork.youngest()
                    print(young)
                    expect(young.name).to(equal("Sasha"))
                }
            }
            
        }
    }
    
}


//describe("beforeEach and afterEach behaviour") {
//      beforeEach {
//        print("⭐️ top before each")
//      }
//
//      context("some context") {
//        beforeEach {
//          print("👉 context before each")
//        }
//
//        it("example 1") { print("😊 example 1") }
//
//        it("example 2") { print("😊 example 2") }
//
//        it("example 3") { print("😊 example 3") }
//
//        afterEach {
//          print("👉 context after each")
//        }
//      }
//
//      context("another context") {
//        beforeEach {
//          print("🍎 context before each")
//        }
//
//        it("example 1") { print("😜 example 1") }
//
//        it("example 2") { print("😜 example 2") }
//
//        afterEach {
//          print("🍎 context after each")
//        }
//      }
//
//      afterEach {
//        print("⭐️ top after each")
//      }
//    }
//  }

