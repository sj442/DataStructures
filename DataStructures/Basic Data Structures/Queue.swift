//
//  Queue.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/25/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

struct Queue<T: Equatable> {
  
  // linked list implementation
  var first: Node<T>?
  
  var last: Node<T>?
  
  var numberOfObjects = 0
  
  func isEmpty() -> Bool {
    return first == nil
  }
  
  func size() -> Int {
    return numberOfObjects
  }
  
  // Returns the least recently added item to the list
  func peek() -> T? {
   return first?.value
  }
  
  mutating func enqueue(item: T) {
    if isEmpty() {
      first = Node(withValue: item)
      last = first
      return
    }
    
    let temp = last
    last = Node(withValue: item)
    temp?.next = last
    numberOfObjects += 1
  }
  
  mutating func dequeue() -> T? {
    if isEmpty() {
      return nil
    }
    
    let oldFirst = first
    first = oldFirst?.next
    numberOfObjects -= 1
    return oldFirst?.value
  }
  
}
