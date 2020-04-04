//
//  Collection + Extension.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 03.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

// Write an extension for collections of integers that returns the number of times a specific digit appears in any of its numbers.
// The code [5, 15, 55, 515].challenge1(count: "5") should return 6
public extension Collection where Iterator.Element == Int {
    func challenge1a(count: Character) -> Int {
        var total = 0
        
        // loop over every element
        for item in self {
            // stringify this integer
            let str = String(item)
            
            // loop over letter in the string
            for letter in str {
                if letter == count {
                    total += 1
                }
            }
        }
        
        return total
    }
    
    func challenge1b(count: Character) -> Int {
        return self.reduce(0) { $0 + String($1).filter { (char: Character) -> Bool in char == count }.count
        }
    }
}

// Write an extension for all collections that returns the N smallest elements as an array, sorted smallest first, where N is an integer parameter.
// The code [1, 2, 3, 4].challenge2(count: 3) should return [1, 2, 3]
public extension Collection where Iterator.Element: Comparable {
    func challenge2(count: Int) -> [Iterator.Element] {
        let sorted = self.sorted()
        return Array(sorted.prefix(count))
    }
}

// Extend collections with a function that returns an array of strings sorted by their lengths, longest first.
// The code ["a", "abc", "ab"].challenge3() should return ["abc", "ab", "a"].
public extension Collection where Iterator.Element == String {
    func challenge3() -> [Iterator.Element] {
        return self.sorted(by: { $0.count > $1.count })
    }
}

// Write an extension to collections that accepts an array of Int and returns the median average, or nil if there are no values.
// The code [1, 2, 3].challenge5() should return 2.
public extension Collection where Iterator.Element == Int {
    func challenge5() -> Double? {
        guard count != 0 else { return nil }
        
        let sorted = self.sorted()
        let middle = sorted.count / 2
        
        if sorted.count % 2 == 0 {
            return Double(sorted[middle] + sorted[middle - 1]) / 2
        } else {
            return Double(sorted[middle])
        }
    }
}

// Write an extension for all collections that reimplements the firstIndex(of:) method.
// The code [1, 2, 3].challenge6(firstIndexOf: 1) should return 0.
public extension Collection where Iterator.Element == Int {
    func challenge6(of item: Int) -> Int? {
        return self.firstIndex(where: { $0 == item }) as? Int
    }
}

// Write an extension for all collections that reimplements the map() method.
// The code [1, 2, 3].challenge10 { String($0) } should return [“1”, "2", "3"]
public extension Collection {
    func challenge10<T>(_ transform: (Iterator.Element) throws -> T) rethrows -> [T] {
        var returnValue = [T]()
        for item in self {
            returnValue.append(try transform(item))
        }
        
        return returnValue
    }
}

// Write an extension for all collections that reimplements the min() method.
// The code [1, 2, 3].challenge11() should return 1.
public extension Collection where Iterator.Element: Comparable {
    func challenge11() -> Iterator.Element? {
        let sorted = self.sorted()
        
        return sorted.first
    }
}
