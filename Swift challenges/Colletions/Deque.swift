//
//  Deque.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 04.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public struct Deque<T> {
    private var array = [T]()
    
    public init() { }

    public var count: Int {
        return array.count
    }

    public mutating func pushBack(_ obj: T) {
        array.append(obj)
    }

    public mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }

    public mutating func popBack() -> T? {
        return array.popLast()
    }

    public mutating func popFront() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}
