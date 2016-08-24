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
  
  mutating func addItem(item: T) {
    let oldHead = head
    let newNode = Node(withValue: item)
    head = newNode
    newNode.next = oldHead
    numberOfObjects += 1
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
    return current?.value
  }
  
  func hasNext() -> Bool {
    guard let _ = current?.next else {
      return false
    }
    return true
  }
}


extension Bag: SequenceType {
  
  func generate() -> BagGenerator<T> {
    return BagGenerator(withHead: head)
  }
  
}


extension Bag: Iterable {
  
  func iterate() -> [T] {
    guard let head = head else {
      return []
    }
    var array = [T]()
    var x = head
    while x.next != nil {
      array.append(x.value)
      x = x.next!
    }
    array.append(x.value)
    return array
  }
  
  subscript(index: Int) -> T? {
    var counter = 0
    guard let head = head else {
      return nil
    }
    var x = head
    while x.next != nil && counter < size() {
      if counter == index {
        return x.value
      }
      x = x.next!
      counter += 1
    }
    return nil
  }
  
}
