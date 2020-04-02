//
//  StringsChallenges.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 28.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public final class StringsChallenges {
    
    // Method to check strings duplicates
    public static func challenge1(input: String) -> Bool {
        return Set(input).count == input.count
    }
    
    // Method to check if the string is a palindrom
    public static func challenge2(input: String) -> Bool {
        let lowercased = input.lowercased()
        return lowercased == String(lowercased.reversed())
    }
    
    // Method to check if the two strings contain the same characters
    public static func challenge3(inputA: String, inputB: String) -> Bool {
        return inputA.sorted() == inputB.sorted()
    }
    
    // Method to check if string contains another string
    public static func challenge4(inputA: String, inputB: String) -> Bool {
        let first = inputA.lowercased()
        let second = inputB.lowercased()
        return first.contains(second) || second.contains(first)
    }
    
    // Method to get count the characters
    public static func challenge5(input: String, char: Character) -> Int {
        return input.filter { $0 == char }.count
    }
    
    // Method to get count the characters using reduce
    public static func challenge5b(input: String, count: Character) -> Int {
        return input.reduce(0) { $1 == count ? $0 + 1 : $0 }
    }
    
    // Method to remove duplicate letters from a string
    public static func challenge6(input: String) -> String {
        var usedChars = [Character]()
        _ = input.forEach { item in
            if !usedChars.contains(item) {
                usedChars.append(item)
            }
        }
        return String(usedChars)
    }
    
    // Method to get string with any consecutive spaces replaced with a single space
    public static func challenge7(input: String) -> String {
        var used = [Character]()
        _ = input.forEach { item in
            if item == " ", let last = used.last {
                if last != " " {
                    used.append(item)
                }
            } else {
                used.append(item)
            }
        }
        
        return String(used)
    }
    
    public static func challenge7b(input: String) -> String {
        return input.replacingOccurrences(of: " +", with: " ", options: .regularExpression, range: nil)
    }
    
    // Method to check if one string is rotation of the other
    public static func challenge8(inputA: String, inputB: String) -> Bool {
        guard inputA.count == inputB.count else { return false }
        let combined = inputA + inputA
        return combined.contains(inputB)
    }
    
    // Method to check if a string is a pangram
    public static func challenge9(input: String) -> Bool {
        let set = Set(input.lowercased())
        let letters = set.filter { $0 >= "a" && $0 <= "z" }
        return letters.count == 26
    }
    
    // Method to return vowels and consonants
    public static func challenge10(input: String) -> (Int, Int) {
        let inputLowercased = input.lowercased()
        let vowels: [Character] = ["a", "e", "i", "o", "u"]
        let consonants: [Character] = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]

        var vowelsCounter = 0
        var consonantsCounter = 0
        
        for char in inputLowercased {
            if vowels.contains(char) {
                vowelsCounter += 1
            } else if consonants.contains(char) {
                consonantsCounter += 1
            }
        }
        
        return (vowelsCounter, consonantsCounter)
    }
    
    // Method to check if strings identical or have no more three different letters
    public static func challenge11(inputA: String, inputB: String) -> Bool {
        guard inputA.count == inputB.count else { return false }
        var counter = 0
        let inputAArray = Array(inputA)
        let inputBArray = Array(inputB)
        
        for i in 0..<inputAArray.count {
            if inputAArray[i] != inputBArray[i] {
                counter += 1
            }
            
            if counter == 4 {
                return false
            }
        }
        
        return counter <= 3
    }
    
    // Method to get the longest prefix from several words
    public static func challenge12(input: String) -> String {
        let words = input.components(separatedBy: " ")
        var prefix = ""
        for char in words.first ?? "" {
            let newPrefix = prefix.appending(String(char))
            for word in words {
                if !word.hasPrefix(newPrefix) {
                    return prefix
                }
            }
            
            prefix = newPrefix
        }
        
        return ""
    }
    
    // Method to get how often each letter is repeated
    public static func challenge13(input: String) -> String {
        var currentChar = ""
        var counter = 0
        var result = ""
        
        for (i, char) in Array(input).enumerated() {
            if currentChar.isEmpty {
                currentChar = String(char)
                counter += 1
                continue
            }
            
            if String(char) == String(currentChar) {
                counter += 1
            } else if String(char) != String(currentChar) {
                result.append("\(String(currentChar))\(counter)")
                currentChar = String(char)
                counter = 1
            }
             
            if i == input.count - 1 {
                result.append("\(String(currentChar))\(counter)")
            }
        }
        
        return result
    }
    
    // Method to print all possible permutations of a given input string
    public static func challenge14(input: String, current: String = "") {
        let length = input.count
        let strArray = Array(input)
        
        if (length == 0) {
            // there's nothing left to re-arrange; print the result
            print(current)
            print("******")
        } else {
            print(current)
            
            // loop through every character
            for i in 0 ..< length {
                // get the letters before me
                let left = String(strArray[0 ..< i])
                
                // get the letters after me
                let right = String(strArray[i+1 ..< length])
                // put those two together and carry on
                challenge14(input: left + right, current: current + String(strArray[i]))
            }
        }
    }
    
    public static func challenge15(input: String) -> String {
        let words = input.components(separatedBy: " ")
    
        return words.map { String($0.reversed()) }.joined(separator: " ")
    }
}
