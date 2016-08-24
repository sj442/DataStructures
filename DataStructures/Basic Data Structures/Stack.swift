//
//  Stack.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/25/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

struct Stack<T: Equatable> {
  
  // linked list implementation
  var first: Node<T>?
  
  var numberOfObjects = 0
  
  func isEmpty() -> Bool {
    return numberOfObjects == 0
  }
  
  // Returns the most recently added item to the list
  func peek() -> T? {
    return first?.value
  }
  
  func size() -> Int {
    return numberOfObjects
  }
  
  mutating func push(item: T) {
    let oldFirst = first
    first = Node(withValue: item)
    first?.next = oldFirst
    numberOfObjects += 1
    }
    
  
  mutating func pop() -> T? {
    if isEmpty() {
      return nil
    }
    let oldFirst = first
    first = oldFirst?.next
    numberOfObjects -= 1
    return oldFirst?.value
  }
  
}

extension Stack: Iterable {
  
  func iterate() -> [T] {
    var array = [T]()
    var x = first
    while x != nil {
      array.append(x!.value)
      x = x!.next
    }
    return array
  }
  
  subscript(index: Int) -> T? {
    if isEmpty() {
      return nil
    }
    var counter = 0
    var x = first
    while x != nil && counter < index {
      counter += 1
      x = x?.next
    }
    return x?.value
  }
  
}
