//
//  LinkedListNode.swift
//  Swift challenges
//
//  Created by Stanly Shiyanovskiy on 04.04.2020.
//  Copyright © 2020 Stanly Shiyanovskiy. All rights reserved.
//

import Foundation

public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

public class LinkedList<T> {
    public var start: LinkedListNode<T>?
    public var centerNode: LinkedListNode<T>? {
        var slow = start
        var fast = start
        while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }

        return slow
    }
    
    public func printNodes() {
        var currentNode = start
        
        while let node = currentNode {
            print(node.value, terminator: " ")
            currentNode = node.next
        }
    }
}
