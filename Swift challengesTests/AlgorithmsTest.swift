//
//  AlgorithmsTest.swift
//  Swift challengesTests
//
//  Created by Stanly Shiyanovskiy on 05.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Swift_challenges
import XCTest

class AlgorithmsTest: XCTestCase {

    func testChallenge1() {
        assert([12, 5, 4, 9, 3, 2, 1].challenge1() == [1, 2, 3, 4, 5, 9, 12], "Challenge 1 failed")
        assert(["f", "a", "b"].challenge1() == ["a", "b", "f"], "Challenge 1 failed")
        assert([String]().challenge1() == [], "Challenge 1 failed")
    }
    
    func testChallenge2() {
        assert([12, 5, 4, 9, 3, 2, 1].challenge2() == [1, 2, 3, 4, 5, 9, 12], "Challenge 2 failed")
        assert(["f", "a", "b"].challenge2() == ["a", "b", "f"], "Challenge 2 failed")
        assert([String]().challenge2() == [], "Challenge 2 failed")
    }
    
    func testChallenge3() {
        assert(AlgorithmsChallenges.challenge3(first: "clap", second: "slap") == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "rum", second: "mud") == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "pip", second: "did") == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "carry", second: "baddy") == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "cream", second: "lapse") == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: 123123, second: 456456) == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: 3.14159, second: 2.03048) == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: [1, 2, 1, 2, 3], second: [4, 5, 4, 5, 6]) == true, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "carry", second: "daddy") == false, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "did", second: "cad") == false, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "maim", second: "same") == false, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: "curry", second: "flurry") == false, "Challenge 3 failed")
        assert(AlgorithmsChallenges.challenge3(first: 112233, second: 112211) == false, "Challenge 3 failed")
    }

    func testChallenge4() {
        assert(AlgorithmsChallenges.challenge4(input: "()") == true, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([])") == true, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([])(<{}>)") == true, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([]{}<[{}]>)") == true, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "") == true, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "}{") == false, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([)]") == false, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([)") == false, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "([") == false, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "[<<<{}>>]") == false, "Challenge 4 failed")
        assert(AlgorithmsChallenges.challenge4(input: "hello") == false, "Challenge 4 failed")
    }
    
    func testChallenge5() {
        assert([12, 5, 4, 9, 3, 2, 1].challenge5() == [1, 2, 3, 4, 5, 9, 12], "Challenge 5 failed")
        assert(["f", "a", "b"].challenge5() == ["a", "b", "f"], "Challenge 5 failed")
        assert([String]().challenge5() == [], "Challenge 5 failed")
    }
    
    func testChallenge6() {
        assert(AlgorithmsChallenges.challenge6([["X", "", "O"], ["", "X", "O"], ["", "", "X"]]) == true, "Challenge 6 failed")
        assert(AlgorithmsChallenges.challenge6([["X", "", "O"], ["X", "", "O"], ["X", "", ""]]) == true, "Challenge 6 failed")
        assert(AlgorithmsChallenges.challenge6([["", "X", ""], ["O", "X", ""], ["O", "X", ""]]) == true, "Challenge 6 failed")
        assert(AlgorithmsChallenges.challenge6([["", "X", ""], ["O", "X", ""], ["O", "", "X"]]) == false, "Challenge 6 failed")
        assert(AlgorithmsChallenges.challenge6([["", "", ""], ["", "", ""], ["", "", ""]]) == false, "Challenge 6 failed")
    }
    
    func testChallenge7() {
        assert(AlgorithmsChallenges.challenge7(upTo: 10) == [2, 3, 5, 7], "Challenge 7 failed")
        assert(AlgorithmsChallenges.challenge7(upTo: 11) == [2, 3, 5, 7], "Challenge 7 failed")
        assert(AlgorithmsChallenges.challenge7(upTo: 12) == [2, 3, 5, 7, 11], "Challenge 7 failed")
    }
    
    func testChallenge8() {
        var points = [(first: CGPoint, second: CGPoint)]()
        points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: -100)))
        points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: -100)))
        points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 0)))
        points.append((first: CGPoint.zero, second: CGPoint(x: 100, y: 100)))
        points.append((first: CGPoint.zero, second: CGPoint(x: 0, y: 100)))
        points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 100)))
        points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: 0)))
        points.append((first: CGPoint.zero, second: CGPoint(x: -100, y: -100)))
        assert(AlgorithmsChallenges.challenge8(points: points) == [0.0, 45.0, 90.0, 135.0, 180.0, 225.0, 270.0, 315.0], "Challenge 8 failed")
    }
    
    func testChallenge9() { }
    func testChallenge10() { }
}
