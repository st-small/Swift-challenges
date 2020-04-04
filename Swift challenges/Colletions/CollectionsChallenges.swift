//
//  CollectionsChallenges.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 03.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public final class CollectionsChallenges {
    
    public static func challenge1() { }
    public static func challenge2() { }
    public static func challenge3() { }
    
    // Method that accepts an array of unsorted numbers from 1 to 100 where zero or more numbers might be missing, and returns an array of the missing numbers
    public static func challenge4(array: [Int]) -> [Int] {
        let sorted = array.sorted()
        var result = [Int]()
        var index = array.first!
        for i in sorted {
            if i != index {
                result.append(index)
                index = i
            }
            
            index += 1
        }
        
        return result
    }
    
    public static func challenge5() { }
    public static func challenge6() { }
    
    // Create a linked list of lowercase English alphabet letters, along with a method that traverses all nodes and prints their letters on a single line separated by spaces.
    public static func challenge7() {
        let list = LinkedList<Character>()
        var previousNode: LinkedListNode<Character>? = nil
        
        for letter in "abcdefghijklmnopqrstuvwxyz" {
            let node = LinkedListNode(value: letter)
            
            if let predecessor = previousNode {
                predecessor.next = node
            } else {
                list.start = node
            }
            
            previousNode = node
        }
        
        list.printNodes()
    }
    
    // Extend your linked list class with a new method that returns the node at the mid point of the linked list using no more than one loop
    public static func challenge8() { }
    
    // Write a new method for your binary search tree that traverses the tree in order, running a closure on each node
    public static func challenge9() {
//        func traverse(_ body: (Node<T>) -> Void) {
//            left?.traverse(body)
//            body(self)
//            right?.traverse(body)
//        }
    }
    
    public static func challenge10() { }
    public static func challenge11() { }
    public static func challenge12() { }
    
    // Write a function that accepts a variadic array of integers and return the sum of all numbers that appear an even number of times
    public static func challenge13(numbers: Int...) -> Int {
        let counted = NSCountedSet(array: numbers)
        let array = counted.allObjects as! [Int]
        var sum = 0
        
        for item in array {
            if counted.count(for: item) % 2 == 0 {
                sum += item
            }
        }
        
        return sum
    }
    
    // Write a function that accepts an array of positive and negative numbers and returns a closed range containing the position of the contiguous positive numbers that sum to the highest value, or nil if nothing were found
    public static func challenge14(_ numbers: [Int]) -> CountableClosedRange<Int>? {
        var bestRange: CountableClosedRange<Int>? = nil
        var bestSum = 0
        
        // these track the current sequence of positive integers
        var currentStart: Int? = nil
        var currentSum = 0
        
        for (index, number) in numbers.enumerated() {
            if number > 0 {
                // if we don't have a start for the current range, set one now
                currentStart = currentStart ?? index
                currentSum += number
                
                if currentSum > bestSum {
                    // update our best range
                    bestRange = currentStart! ... index
                    bestSum = currentSum
                }
            } else {
                // reset the current range
                currentSum = 0
                currentStart = nil
            }
        }
        
        return bestRange
    }
    
    public static func challenge15() { }
    
    // Write one function that sums an array of numbers. The array might contain all integers, all doubles, or all floats.
    public static func challenge16<T: Numeric>(numbers: [T]) -> T? {
        return numbers.reduce(0, +)
    }
}
