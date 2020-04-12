//
//  Array + Extension.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 05.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

// Bubble sort
// Create an extension for arrays that sorts them using the bubble sort algorithm.
// The array [12, 5, 4, 9, 3, 2, 1] should become [1, 2, 3, 4, 5, 9, 12].
public extension Array where Element: Comparable {
    func challenge1() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = self
        var swapsMade: Bool
        
        repeat {
            swapsMade = false
            
            for index in 0 ..< returnValue.count - 1 {
                let element = returnValue[index]
                let next = returnValue[index + 1]
                
                if element > next {
                    returnValue.swapAt(index, index + 1)
                    swapsMade = true
                }
            }
        } while swapsMade == true
        
        return returnValue
    }
}

// Insertion sort
// Create an extension for arrays that sorts them using the insertion sort algorithm.
// The array [12, 5, 4, 9, 3, 2, 1] should become [1, 2, 3, 4, 5, 9, 12].
public extension Array where Element: Comparable {
    func challenge2() -> [Element] {
        guard count > 1 else { return self }
        
        var returnValue = self
        
        for i in 1 ..< count {
            var currentItemIndex = i
            
            let itemToPlace = returnValue[currentItemIndex]
            
            while currentItemIndex > 0 && itemToPlace < returnValue[currentItemIndex - 1] {
                returnValue[currentItemIndex] = returnValue[currentItemIndex - 1]
                currentItemIndex -= 1
            }
            
            returnValue[currentItemIndex] = itemToPlace
        }
        
        return returnValue
    }
}

// Quick sort
// Create an extension for arrays that sorts them using the quicksort algorithm.
public extension Array where Element: Comparable {
    func challenge5() -> [Element] {
        guard count > 1 else { return self }
        
        // pivot on the center of the array
        let pivot = self[count / 2]
        
        // create three new buckets that we'll sort ourselves into
        let before = filter { $0 < pivot }
        let after = filter { $0 > pivot }
        let equal = filter { $0 == pivot }
        
        // call this function recursively then return the combined input
        return before.challenge5() + equal + after.challenge5()
    }
}
