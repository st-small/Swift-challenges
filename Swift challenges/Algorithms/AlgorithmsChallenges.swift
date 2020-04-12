//
//  AlgorithmsChallenges.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 05.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import CoreGraphics
import Foundation

public final class AlgorithmsChallenges {
    
    // Write a function that accepts two values and returns true if they are isomorphic. That is, each part of the value must map to precisely one other, but that might be itself
    public static func challenge3(first firstValue: Any, second secondValue: Any) -> Bool {
        let first = String(describing: firstValue)
        let second = String(describing: secondValue)
        
        guard first.count == second.count else { return false }
        
        var characterMap = [Character: Character]()
        let firstArray = Array(first)
        let secondArray = Array(second)
        
        for (index, character) in firstArray.enumerated() {
            let otherCharacter = secondArray[index]
            
            if let currentMapping = characterMap[character] {
                if currentMapping != otherCharacter {
                    return false
                }
            } else {
                if characterMap.values.contains(otherCharacter) {
                    return false
                }
                
                characterMap[character] = otherCharacter
            }
        }
        
        return true
    }
    
    // Write a function that accepts a string containing the characters (, [, {, <, >, }, ], and ) in any arrangement and frequency. It should return true if the brackets are opened and closed in the correct order, and if all brackets are closed. Any other input should false.
    public static func challenge4(input: String) -> Bool {
        let validBrackets = "([{<>}])"
        let validCharacterSet = CharacterSet(charactersIn: validBrackets).inverted
        guard input.rangeOfCharacter(from: validCharacterSet) == nil else { return false }
        
        let matchingBrackets: [Character: Character] = ["(": ")", "[": "]", "{": "}", "<": ">"]
        var usedBrackets = [Character]()
        
        for bracket in input {
            if matchingBrackets.keys.contains(bracket) {
                // this is an opening bracket
                usedBrackets.append(bracket)
            } else {
                // this is a closing bracket – try to pull off our previous open
                if let previousBracket = usedBrackets.popLast() {
                    if matchingBrackets[previousBracket] != bracket {
                        // if they don't match, this is a bad string
                        return false
                    }
                } else {
                    // we don't have an opening bracket, this is a bad string
                    return false
                }
            }
        }
        
        return usedBrackets.count == 0
    }
    
    // Create a function that detects whether either player has won in a game of Tic-Tac-Toe
    public static func challenge6(_ board: [[String]]) -> Bool {
        func isWin(_ first: String, _ second: String, _ third: String) -> Bool {
            guard first != "" else { return false }
            return first == second && first == third
        }
        
        for i in 0 ..< 3 {
            if isWin(board[i][0], board[i][1], board[i][2]) {
                return true
            }
            
            if isWin(board[0][i], board[1][i], board[2][i]) {
                return true
            }
        }
        
        return isWin(board[0][0], board[1][1], board[2][2]) || isWin(board[0][2], board[1][1], board[2][0])
    }
    
    // Write a function that returns an array of prime numbers from 2 up to but excluding N, taking care to be as efficient as possible
    public static func challenge7(upTo max: Int) -> [Int] {
        guard max > 1 else { return [] }
        
        var sieve = [Bool](repeating: true, count: max)
        sieve[0] = false
        sieve[1] = false
        
        for number in 2 ..< max {
            if sieve[number] == true {
                for multiple in stride(from: number * number, to: sieve.count, by: number) {
                    sieve[multiple] = false
                }
            }
        }
        
        return sieve.enumerated().compactMap { $1 == true ? $0 : nil }
    }
    
    // Write a function that accepts an array of CGPoint pairs, and returns an array of the angles between each point pair. Return the angles in degrees, where 0 or 360 is straight up
    public static func challenge8(points: [(first: CGPoint, second: CGPoint)]) -> [CGFloat] {
        return points.map {
            let radians = atan2($0.first.y - $0.second.y, $0.first.x - $0.second.x)
            var degrees = (radians * 180 / .pi) - 90
            if degrees < 0 { degrees += 360.0 }
            if degrees == 360 { degrees = 0 }
            return degrees
        }
    }
    
    // Write a function that accepts a two-dimensional array of integers that are 0 or 1, a new number to place, and a position to start. You should read the existing number at the start position, change it to the new number, then change any surrounding numbers that matched the start number, then change any surrounding those, and so on - like a flood fill algorithm in Photoshop
    public static func challenge9(fill newNumber: Int, in grid: inout [[Int]], at point: (x: Int, y: Int), replacing: Int? = nil) {
        // bail out if this position is invalid
        guard point.x >= 0 else { return }
        guard point.x < 10 else { return }
        guard point.y >= 0 else { return  }
        guard point.y < 10 else { return }
        
        // `replacing` will be set on 2nd and subsequent runs
        let startNumber = replacing ?? grid[point.y][point.x]
        
        if grid[point.y][point.x] == startNumber {
            // adjust this point
            grid[point.y][point.x] = newNumber
            
            // and fill in surrounding squares
            challenge9(fill: newNumber, in: &grid, at: (x: point.x, y: point.y - 1), replacing: startNumber)
            challenge9(fill: newNumber, in: &grid, at: (x: point.x, y: point.y + 1), replacing: startNumber)
            challenge9(fill: newNumber, in: &grid, at: (x: point.x - 1, y: point.y), replacing: startNumber)
            challenge9(fill: newNumber, in: &grid, at: (x: point.x + 1, y: point.y), replacing: startNumber)
        }
    }
    
    // There are M different ways you can place N queens on an NxN chessboard so that none of them are able to capture others. Write a function that calculates them all and prints them to the screen as a visual board layout, and returns the number of solutions it found
    public static func challenge10(board: [Int], queen queenNumber: Int) -> Int {
        if queenNumber == board.count {
            // we hit a solution – print it out
            print("Solution:", board)
            
            for row in 0 ..< board.count {
                for col in 0 ..< board.count {
                    if board[row] == col {
                        print("Q", terminator: "")
                    } else {
                        print(".", terminator: "")
                    }
                }
                
                print("")
            }
            
            print("")
            return 1
        } else {
            // keep track how many solutions were found by our recursive calls
            var count = 0
            
            // loop over every column
            boardLoop: for column in 0 ..< board.count {
                
                // check only queens that are placed already
                for row in 0 ..< queenNumber {
                    // find where this queen was placed
                    let otherQueenColumn = board[row]
                    
                    // if this queen is placed in the column we are checking, stop checking other queens and go to the next column
                    if otherQueenColumn == column { continue boardLoop }
                    
                    // calculate the difference in our row/column and the checking queen's row/column
                    let deltaRow = queenNumber - row
                    let deltaCol = otherQueenColumn - column
                    
                    // if we are on a diagonal with this queen, stop checking other queens and proceed to the next column
                    if deltaRow == deltaCol { continue boardLoop }
                    if deltaRow == -deltaCol { continue boardLoop }
                }
                
                // if we're still here it means this move is valid, so take a copy of the board and make the move on the copy
                var boardCopy = board
                boardCopy[queenNumber] = column
                
                // now call ourselves recursively, placing one queen number higher, and adding it return value to our solution counter
                count += challenge10(board: boardCopy, queen: queenNumber + 1)
            }
            
            // return our solution counter to the caller
            return count
        }
    }
}
