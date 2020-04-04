//
//  CollectionsTest.swift
//  Swift challengesTests
//
//  Created by Stanly Shiyanovskiy on 03.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Swift_challenges
import XCTest

class CollectionsTest: XCTestCase {

    func testChallenge1a() {
        assert([5, 15, 55, 515].challenge1a(count: "5") == 6, "Challenge 1a failed")
        assert([5, 15, 55, 515].challenge1a(count: "1") == 2, "Challenge 1a failed")
        assert([55555].challenge1a(count: "5") == 5, "Challenge 1a failed")
        assert([55555].challenge1a(count: "1") == 0, "Challenge 1a failed")
    }

    func testChallenge1b() {
        assert([5, 15, 55, 515].challenge1b(count: "5") == 6, "Challenge 1b failed")
        assert([5, 15, 55, 515].challenge1b(count: "1") == 2, "Challenge 1b failed")
        assert([55555].challenge1b(count: "5") == 5, "Challenge 1b failed")
        assert([55555].challenge1b(count: "1") == 0, "Challenge 1b failed")
    }
    
    func testChallenge2() {
        assert([1, 2, 3, 4].challenge2(count: 3) == [1, 2, 3], "Challenge 2 failed")
        assert(["q", "f", "k"].challenge2(count: 10) == ["f", "k", "q"], "Challenge 2 failed")
        assert([256, 16].challenge2(count: 3) == [16, 256], "Challenge 2 failed")
        assert([String]().challenge2(count: 3) == [], "Challenge 2 failed")
    }
    
    func testChallenge3() {
        assert(["a", "abc", "ab"].challenge3() == ["abc", "ab", "a"], "Challenge 3 failed")
        assert(["paul", "taylor", "adele"].challenge3() == ["taylor", "adele", "paul"], "Challenge 3 failed")
        assert([String]().challenge3() == [], "Challenge 3 failed")
    }
    
    func testChallenge4() {
        var testArray = Array(1...100)
        testArray.remove(at: 25)
        testArray.remove(at: 20)
        testArray.remove(at: 6)
        assert(CollectionsChallenges.challenge4(array: testArray) == [7, 21, 26], "Challenge 4 failed")
    }
    
    func testChallenge5() {
        assert([1, 2, 3].challenge5() == 2, "Challenge 5 failed")
        assert([1, 2, 9].challenge5() == 2, "Challenge 5 failed")
        assert([1, 3, 5, 7, 9].challenge5() == 5, "Challenge 5 failed")
        assert([1, 2, 3, 4].challenge5() == 2.5, "Challenge 5 failed")
        assert([Int]().challenge5() == nil, "Challenge 5 failed")
    }
    
    func testChallenge6() {
        assert([1, 2, 3].challenge6(of: 1) == 0, "Challenge 6 failed")
        assert([1, 2, 3].challenge6(of: 3) == 2, "Challenge 6 failed")
        assert([1, 2, 3].challenge6(of: 5) == nil, "Challenge 6 failed")
    }
    
    func testChallenge10() {
        assert([1, 2, 3].challenge10 { String($0) } == ["1", "2", "3"], "Challenge 10 failed")
        assert(["1", "2", "3"].challenge10 { Int($0) } == [1, 2, 3], "Challenge 10 failed")
    }
    
    func testChallenge11() {
        assert([1, 2, 3].challenge11() == 1, "Challenge 11 failed")
        assert(["q", "f", "k"].challenge11() == "f", "Challenge 11 failed")
        assert([4096, 256, 16].challenge11() == 16, "Challenge 11 failed")
        assert([String]().challenge11() == nil, "Challenge 11 failed")
    }
    
    func testChallenge12() {
        var numbers = Deque<Int>()
        numbers.pushBack(5)
        numbers.pushBack(8)
        numbers.pushBack(3)
        assert(numbers.count == 3, "Challenge 12 failed")
        assert(numbers.popFront()! == 5, "Challenge 12 failed")
        assert(numbers.popBack()! == 3, "Challenge 12 failed")
        assert(numbers.popFront()! == 8, "Challenge 12 failed")
        assert(numbers.popBack() == nil, "Challenge 12 failed")
    }
    
    func testChallenge13() {
        assert(CollectionsChallenges.challenge13(numbers: 1, 2, 2, 3, 3, 4) == 5, "Challenge 13 failed")
        assert(CollectionsChallenges.challenge13(numbers: 5, 5, 5, 12, 12) == 12, "Challenge 13 failed")
        assert(CollectionsChallenges.challenge13(numbers: 1, 1, 2, 2, 3, 3, 4, 4) == 10, "Challenge 13 failed")
    }
    
    func testChallenge14() {
        assert(CollectionsChallenges.challenge14([0, 1, 1, -1, 2, 3, 1]) == 4...6, "Challenge 14 failed")
        assert(CollectionsChallenges.challenge14([10, 20, 30, -10, 20, 10, 20]) == 0...2, "Challenge 14 failed")
        assert(CollectionsChallenges.challenge14([1, -1, 2, -1]) == 2...2, "Challenge 14 failed")
        assert(CollectionsChallenges.challenge14([2, 0, 2, 0, 2]) == 0...0, "Challenge 14 failed")
        assert(CollectionsChallenges.challenge14([Int]()) == nil, "Challenge 14 failed")
    }
    
    func testChallenge16() {
        assert(CollectionsChallenges.challenge16(numbers: [1, 2, 3]) == 6, "Challenge 16 failed")
        assert(CollectionsChallenges.challenge16(numbers: [1.0, 2.0, 3.0]) == 6.0, "Challenge 16 failed")
        assert(CollectionsChallenges.challenge16(numbers: Array<Float>([1.0, 2.0, 3.0])) == 6.0, "Challenge 16 failed")
    }
}
