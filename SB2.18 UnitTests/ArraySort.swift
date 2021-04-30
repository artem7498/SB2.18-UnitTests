//
//  ArraySort.swift
//  SB2.18 UnitTests
//
//  Created by Артём on 4/29/21.
//

import Foundation

struct Employee: Equatable {
    var name: String
    var age: Int
}

class ArraySort{
    
    func sortItemsByAge(_ items: [Employee]) -> [Employee] {
        items.sorted { itemA, itemB in
        itemA.age < itemB.age
        }
    }
    
    func arithmetic(array: [Int]) -> Double{
        var total = 0
        for el in array {
            total += el
        }
        return Double(total) / Double(array.count)
    }
    
    func oneString<T: Equatable>(_ array: [T]) -> String{
        var str = ""
        for el in array {
            if el == array.last{
                str += "\(el)"
            } else {
                str += "\(el), "
            }
        }
        return str
    }
    
    func findMin(_ array: [Int]) -> Int{
            var minimumValue = array[0]
            for v in array{
                if v < minimumValue {minimumValue = v}
            }
            return minimumValue
        }
    
    func sortFiles(_ array: [String]) -> [String]{
        array.sorted { (lhs: String, rhs: String) -> Bool in
            return lhs.localizedStandardCompare(rhs) == .orderedAscending
        }
    }
    
}
