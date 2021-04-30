//
//  RealmPerson.swift
//  SB2.18 UnitTestsTests
//
//  Created by Артём on 4/29/21.
//

import Foundation
import RealmSwift

//enum Gender {
//    case male, female
//}

class Person: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var height = 0.0
    @objc dynamic var weight = 0.0
    @objc dynamic var male = ""
    @objc dynamic var birthDate = "22.07.1994"
    
}

class RealmPersonWork{
    
    static let shared = RealmPersonWork()
    
    private let realm  = try! Realm()
    
    func getPersons() -> Results<Person>{
        realm.objects(Person.self)
    }
    
    func save(name: String, height: Double, weight: Double, male: String, birthDate: String){
        let person = Person()
        person.name = name
        person.height = height
        person.weight = weight
        person.male = male
        person.birthDate = birthDate
        
        try! realm.write{
            realm.add(person)
        }
    }
    
    func delete(index: Int){
        let person = realm.objects(Person.self)[index]
        try! realm.write{
            realm.delete(person)
        }
    }
    
    func youngest() -> Person{
        let people = realm.objects(Person.self)
        let temp = people.sorted{ $0.dateFromString > $1.dateFromString}
        return temp[0]
    }
    
    func oldest() -> Person{
        let people = realm.objects(Person.self)
        let temp = people.sorted{ $0.dateFromString < $1.dateFromString}
        return temp[0]
    }
    
}

extension Person{
    static  let isoFormatter : ISO8601DateFormatter = {
        let formatter =  ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate,]
        return formatter
    }()
    
    var dateFromString : Date  {
        let  iSO8601DateString = birthDate.components(separatedBy: ".").reversed().joined(separator: ".")
        return  Person.isoFormatter.date(from: iSO8601DateString)!
    }
}
