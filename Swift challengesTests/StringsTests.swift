//
//  StringsTests.swift
//  Swift challengesTests
//
//  Created by Stanly Shiyanovskiy on 28.03.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Swift_challenges
import XCTest

public class StringsTests: XCTestCase {

    func testChallenge1() {
        assert(StringsChallenges.challenge1(input: "No duplicates") == true, "Challenge 1 failed")
        assert(StringsChallenges.challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge1 failed")
        assert(StringsChallenges.challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
        assert(StringsChallenges.challenge1(input: "Hello, world") == false, "Challenge 1 failed")
    }

    func testChallenge2() {
        assert(StringsChallenges.challenge2(input: "rotator") == true, "Challenge 2 failed")
        assert(StringsChallenges.challenge2(input: "Rats live on no evil star") == true, "Challenge 2 failed")
        assert(StringsChallenges.challenge2(input: "Never odd or even") == false, "Challenge 2 failed")
        assert(StringsChallenges.challenge2(input: "Hello world") == false, "Challenge 2 failed")
    }
    
    func testChallenge3() {
        assert(StringsChallenges.challenge3(inputA: "abca", inputB: "abca") == true, "Challenge 3 failed")
        assert(StringsChallenges.challenge3(inputA: "abc", inputB: "cba") == true, "Challenge 3 failed")
        assert(StringsChallenges.challenge3(inputA: "a1 b2", inputB: "b1 a2") == true, "Challenge 3 failed")
        assert(StringsChallenges.challenge3(inputA: "abc", inputB: "abca") == false, "Challenge 3 failed")
        assert(StringsChallenges.challenge3(inputA: "abc", inputB: "Abc") == false, "Challenge 3 failed")
    }
    
    func testChallenge4() {
        assert(StringsChallenges.challenge4(inputA: "Hello, world", inputB: "Hello") == true, "Challenge 4 failed")
        assert(StringsChallenges.challenge4(inputA: "Hello, world", inputB: "WORLD") == true, "Challenge 4 failed")
        assert(StringsChallenges.challenge4(inputA: "Hello, world", inputB: "Goodbye") == false, "Challenge 4 failed")
    }
    
    func testChallenge4Extension() {
        assert("Hello, world".fuzzyContains("Hello") == true, "Challenge 4 failed")
        assert("Hello, world".fuzzyContains("WORLD") == true, "Challenge 4 failed")
        assert("Hello, world".fuzzyContains("Goodbye") == false, "Challenge 4 failed")
    }
    
    func testChallenge5() {
        assert(StringsChallenges.challenge5(input: "The rain in Spain", char: "a") == 2, "Challenge 5 failed")
        assert(StringsChallenges.challenge5(input: "Mississippi", char: "i") == 4, "Challenge 5 failed")
        assert(StringsChallenges.challenge5(input: "Hacking with Swift", char: "i") == 3, "Challenge 5 failed")
    }
    
    func testChallenge5WithReduce() {
        assert(StringsChallenges.challenge5b(input: "The rain in Spain", count: "a") == 2, "Challenge 5b failed")
        assert(StringsChallenges.challenge5b(input: "Mississippi", count: "i") == 4, "Challenge 5b failed")
        assert(StringsChallenges.challenge5b(input: "Hacking with Swift", count: "i") == 3, "Challenge 5b failed")
    }
    
    func testChallenge6() {
        assert(StringsChallenges.challenge6(input: "wombat") == "wombat", "Challenge 6 failed")
        assert(StringsChallenges.challenge6(input: "hello") == "helo", "Challenge 6 failed")
        assert(StringsChallenges.challenge6(input: "Mississippi") == "Misp", "Challenge 6 failed")
    }
    
    func testChallenge7() {
        assert(StringsChallenges.challenge7(input: "a   b   c") == "a b c", "Challenge 7 failed")
        assert(StringsChallenges.challenge7(input: "    a") == " a", "Challenge 7 failed")
        assert(StringsChallenges.challenge7(input: "abc") == "abc", "Challenge 7 failed")
    }
    
    func testChallenge7WithRegularExpression() {
        assert(StringsChallenges.challenge7(input: "a   b   c") == "a b c", "Challenge 7 failed")
        assert(StringsChallenges.challenge7(input: "    a") == " a", "Challenge 7 failed")
        assert(StringsChallenges.challenge7(input: "abc") == "abc", "Challenge 7 failed")
    }
    
    func testChallenge8() {
        assert(StringsChallenges.challenge8(inputA: "abcde", inputB: "eabcd") == true, "Challenge 8 failed")
        assert(StringsChallenges.challenge8(inputA: "abcde", inputB: "cdeab") == true, "Challenge 8 failed")
        assert(StringsChallenges.challenge8(inputA: "abcde", inputB: "abced") == false, "Challenge 8 failed")
        assert(StringsChallenges.challenge8(inputA: "abc", inputB: "a") == false, "Challenge 8 failed")
    }
    
    func testChallenge9() {
        assert(StringsChallenges.challenge9(input: "The quick brown fox jumps over the lazy dog") == true, "Challenge 9 failed")
        assert(StringsChallenges.challenge9(input: "The quick brown fox jumped over the lazy dog") == false, "Challenge 9 failed")
    }
    
    func testChallenge10() {
        assert(StringsChallenges.challenge10(input: "Swift Coding Challenges") == (6, 15), "Challenge 10 failed")
        assert(StringsChallenges.challenge10(input: "Mississippi") == (4, 7), "Challenge 10 failed")
    }
    
    func testChallenge11() {
        assert(StringsChallenges.challenge11(inputA: "Clamp", inputB: "Cramp") == true, "Challenge 11 failed")
        assert(StringsChallenges.challenge11(inputA: "Clamp", inputB: "Crams") == true, "Challenge 11 failed")
        assert(StringsChallenges.challenge11(inputA: "Clamp", inputB: "Grams") == true, "Challenge 11 failed")
        assert(StringsChallenges.challenge11(inputA: "Clamp", inputB: "Grans") == false, "Challenge 11 failed")
        assert(StringsChallenges.challenge11(inputA: "Clamp", inputB: "Clam") == false, "Challenge 11 failed")
        assert(StringsChallenges.challenge11(inputA: "clamp", inputB: "maple") == false, "Challenge 11 failed")
    }
    
    func testChallenge12() {
        assert(StringsChallenges.challenge12(input: "swift switch swill swim") == "swi", "Challenge 12 failed")
        assert(StringsChallenges.challenge12(input: "flip flap flop") == "fl", "Challenge 12 failed")
    }
    
    func testChallenge13() {
        assert(StringsChallenges.challenge13(input: "aabbcc") == "a2b2c2", "Challenge 13 failed")
        assert(StringsChallenges.challenge13(input: "aaabaaabaaa") == "a3b1a3b1a3", "Challenge 13 failed")
    }
    
    func testChallenge14() { }
    
    func testChallenge15() {
        assert(StringsChallenges.challenge15(input: "Swift Coding Challenges") == "tfiwS gnidoC segnellahC", "Challenge 15 failed")
        assert(StringsChallenges.challenge15(input: "The quick brown fox") == "ehT kciuq nworb xof", "Challenge 15 failed")
    }
}
