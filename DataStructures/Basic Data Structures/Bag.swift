//
//  Bag.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/25/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

// A generic bag implemented using a singly-linked list
struct Bag<T: Equatable> {
  
  var head: Node<T>?
  
  var numberOfObjects = 0
  
  // Returns true if bag is empty
  func isEmpty() -> Bool {
    return head == nil
  }
  
  func size() -> Int {
    return numberOfObjects
  }
  
  mutating func add(item: T) {
    let oldHead = head
    let newNode = Node(withValue: item)
    head = newNode
    newNode.next = oldHead
  }
  
}


struct BagGenerator<T: Equatable>: GeneratorType {
  
  var current: Node<T>?
  
  init(withHead head: Node<T>?) {
    self.current = head
  }
  
  mutating func next() -> T? {
    if !hasNext() {
      return nil
    }
    let item = current
    current = item?.next
    return item?.value
  }
  
  func hasNext() -> Bool {
    return current != nil
  }
}


extension Bag: SequenceType {
  
  
  func generate() -> BagGenerator<T> {
    return BagGenerator(withHead: head)
  }
  
}