//
//  NumbersTests.swift
//  Swift challengesTests
//
//  Created by Stanly Shiyanovskiy on 02.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//
import Swift_challenges
import XCTest

class NumbersTests: XCTestCase {

    func testChallenge2() {
        let value = NumbersChallenges.challenge2(min: 1, max: 5)
        assert(value >= 1 && value <= 5, "Challenge 2 failed")
        let secondValue = NumbersChallenges.challenge2(min: 8, max: 10)
        assert(secondValue >= 8 && secondValue <= 10, "Challenge 2 failed")
        let thirdValue = NumbersChallenges.challenge2(min: 12, max: 12)
        assert(thirdValue == 12, "Challenge 2 failed")
    }

    func testChallenge3() {
        assert(NumbersChallenges.challenge3(number: 4, power: 3) == 64, "Challenge 3 failed")
        assert(NumbersChallenges.challenge3(number: 2, power: 8) == 256, "Challenge 3 failed")
    }
    
    func testChallenges4() {
        var a = 1
        var b = 2
        assert(NumbersChallenges.challenge4(a: &a, b: &b) == (2, 1), "Challenge 4 failed")
    }
    
    func testChallenges5() {
        assert(NumbersChallenges.challenge5(n: 11) == true, "Challenge 5 failed")
        assert(NumbersChallenges.challenge5(n: 13) == true, "Challenge 5 failed")
        assert(NumbersChallenges.challenge5(n: 4) == false, "Challenge 5 failed")
        assert(NumbersChallenges.challenge5(n: 9) == false, "Challenge 5 failed")
        assert(NumbersChallenges.challenge5(n: 16777259) == true, "Challenge 5 failed")
    }
    
    func testChallenges6() {
        assert(NumbersChallenges.challenge6(n: 12) == (17, 10), "Challenge 6 failed")
        assert(NumbersChallenges.challenge6(n: 28) == (35, 26), "Challenge 6 failed")
    }
    
    func testChallenges7() {
        assert(NumbersChallenges.challenge7(n: 32) == 4, "Challenge 7 failed")
        assert(NumbersChallenges.challenge7(n: 41) == 148, "Challenge 7 failed")
    }
    
    func testChallenges8() {
        assert(NumbersChallenges.challenge8(input: "01010101") == true, "Challenge 8 failed")
        assert(NumbersChallenges.challenge8(input: "123456789") == true, "Challenge 8 failed")
        assert(NumbersChallenges.challenge8(input: "9223372036854775808") == true, "Challenge 8 failed")
        assert(NumbersChallenges.challenge8(input: "1.01") == false, "Challenge 8 failed")
    }
    
    func testChallenges9() {
        assert(NumbersChallenges.challenge9(input: "a1b2c3") == 6, "Challenge 9 failed")
        assert(NumbersChallenges.challenge9(input: "a10b20c30") == 60, "Challenge 9 failed")
        assert(NumbersChallenges.challenge9(input: "h8ers") == 8, "Challenge 9 failed")
    }
    
    func testChallenges10() {
        assert(NumbersChallenges.challenge10(n: 9) == 3, "Challenge 10 failed")
        assert(NumbersChallenges.challenge10(n: 16777216) == 4096, "Challenge 10 failed")
        assert(NumbersChallenges.challenge10(n: 16) == 4, "Challenge 10 failed")
        assert(NumbersChallenges.challenge10(n: 15) == 3, "Challenge 10 failed")
    }
    
    func testChallenges11() {
        assert(NumbersChallenges.challenge11(subtract: 5, from: 9) == 4, "Challenge 11 failed")
        assert(NumbersChallenges.challenge11(subtract: 10, from: 30) == 20, "Challenge 11 failed")
    }
}
