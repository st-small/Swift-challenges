//
//  NumbersChallenges.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 02.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public final class NumbersChallenges {
    
    // Method to count from 1 to 100 and print "Fizz", "Buzz" or "Fizz Buzz" string
    public static func challenge1() {
        Array(1...100).forEach { item in
            if item % 3 == 0 && item % 5 == 0 {
                print("Fizz Buzz")
            } else if item % 3 == 0 {
                print("Fizz")
            } else if item % 5 == 0 {
                print("Buzz")
            } else {
                print(item)
            }
        }
    }
    
    // Method to get a random number from accepted range
    public static func challenge2(min: Int, max: Int) -> Int {
        return Array(min...max).randomElement()!
    }
    
    // Method to get power of the number
    public static func challenge3(number: Int, power: Int) -> Int {
        let array = Array(repeating: number, count: power - 1)
        return array.reduce(number, *)
    }
    
    // Method to swap two positive variable integers, a and b, without using a temporary variable
    public static func challenge4(a: inout Int, b: inout Int) -> (Int, Int) {
        a = a + b
        b = a - b
        a = a - b
        
        return (a, b)
    }
    
    // Method to get true if number is prime
    public static func challenge5(n: Int) -> Bool {
        guard n >= 2     else { return false }
        guard n != 2     else { return true  }
        guard n % 2 != 0 else { return false }
        return !stride(from: 3, through: Int(sqrt(Double(n))), by: 2).contains { n % $0 == 0 }
    }
    
    // Method to get next highest and next lowest number that has the same numbers of ones in its binary representation
    public static func challenge6(n: Int) -> (Int, Int) {
        
        func getOnesFromValue(value: Int) -> Int {
            var onesCountInBinary = 0
            let binary = String(value, radix: 2)
            for i in Array(binary) {
                if i == "1" {
                    onesCountInBinary += 1
                }
            }
            
            return onesCountInBinary
        }
        
        let currentOnes = getOnesFromValue(value: n)
        
        var nextHighest = 0
        var heighCounter = n + 1
        while nextHighest == 0 {
            let ones = getOnesFromValue(value: heighCounter)
            if ones == currentOnes {
                nextHighest = heighCounter
            } else {
                heighCounter += 1
            }
        }
        
        var nextLowest = 0
        var lowCounter = n - 1
        while nextLowest == 0 {
            let ones = getOnesFromValue(value: lowCounter)
            if ones == currentOnes {
                nextLowest = lowCounter
            } else {
                lowCounter -= 1
            }
        }
        
        return (nextHighest, nextLowest)
    }
    
    // Method to get binary reverse of an unsigned 8-bit integer
    public static func challenge7(n: UInt8) -> UInt8 {
        var n: UInt8 = n
        var m: UInt8 = 0
        var i: UInt8 = 8
        while i > 0 && n != 0  {
            m = m << 1 + n & 0b1
            n = n >> 1
            i -= 1
        }
        m = m << i
        return m
    }
    
    // Method to check if string contains only numbers
    public static func challenge8(input: String) -> Bool {
        let numbersSet = CharacterSet(charactersIn: "0123456789")
        let inputSet = CharacterSet(charactersIn: input)
        
        return inputSet.isSubset(of: numbersSet)
    }
    
    // Method to pull numbers from string and get their sum
    public static func challenge9(input: String) -> Int {
        let regex = try! NSRegularExpression(pattern: "(\\d+)", options: [])
        let matches = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.utf16.count))
        
        let allNumbers = matches.compactMap { Int((input as NSString).substring(with: $0.range)) }
        
        return allNumbers.reduce(0, +)
    }
    
    // Method to get the square root of a positive integer rounded down to nearest integer
    public static func challenge10(n: Int) -> Int? {
        for i in Array(0...(n - 1)).reversed() {
            let multiply = i * i
            if multiply < n || multiply == n {
                return i
            } 
        }
        
        return nil
    }
    
    // Method to get subtract value from integer
    public static func challenge11(subtract: Int, from: Int) -> Int {
        var result = from
        for _ in 0..<subtract {
            result -= 1
        }
        
        return result
    }
}
