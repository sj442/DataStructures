//
//  LinkedList.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/24/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

struct LinkedList<T: Equatable> {
  
  var head: Node<T>?

  // Returns true if linked list has no elements
  func isEmpty() -> Bool {
    return head == nil
  }
  
  // Adds an element at the beginning of the list. Sets it as the head of the list
  mutating func addFirst(_ item: T) {
    let newNode = Node(withValue: item)
    newNode.next = head
    head = newNode
  }
  
  // Returns the first element in the list
  func getFirst() -> T? {
    return head?.value
  }
  
  // Removes the first element from the list and sets the second element as the head
  mutating func removeFirst() -> T? {
    guard let head = head else {
      return nil
    }
    let value = head.value
    let second = head.next
    self.head = second
    return value
  }
  
  // Adds an item to the end of the list
  mutating func addLast(_ item: T) {
    guard let head = head else {
      self.head = Node(withValue: item)
      return
    }
    var x = head
    while x.next != nil {
      x = x.next!
    }
    x.next = Node(withValue: item)
  }
  
  // Returns the last item in the list
  func getLast() -> T? {
    guard let head = head else {
      return nil
    }
    var x = head
    while x.next != nil {
      x = x.next!
    }
    return x.value
  }
  
  // Removes all elements from the list
  mutating func clear() {
    head = nil
  }
  
  // Removes and returns the last element from the list
  mutating func removeLast() -> T? {
    guard let head = head else {
      return nil
    }
    if head.next == nil {
      let value = head.value
      self.head = nil
      return value
    }
    var x = head
    var temp = head
    while x.next != nil {
      temp = x
      x = x.next!
    }
    let last = temp.next
    temp.next = nil
    return last?.value
  }
  
  // Checks if an item is present in the list
  func contains(_ item: T) -> Bool {
    var x = head
    while x != nil {
      if x!.value == item {
        return true
      }
      x = x!.next
    }
    return false
  }
  
  // Returns the ite at a given index from the head in the list
  func get(_ index: Int) -> T? {
    var counter = 0
    var x = head
    
    while counter < index {
      x = x?.next
      counter += 1
    }
    return x?.value
  }
  
  // Inserts element after given element
  mutating func insertAfter(_ key: T, toInsert: T) {
    var x: Node<T>?
    
    if let head = head {
      x = head
    } else {
      self.head = Node(withValue: toInsert)
      return
    }
    
    while x != nil && x?.value != key {
      x = x?.next
    }
    
    let next = x?.next
    let newNode = Node(withValue: toInsert)
    newNode.next = next
    x?.next = newNode
  }
  
  // Inserts element before given element
  mutating func insertBefore(_ key: T, toInsert: T) {
    var x: Node<T>?

    guard let head = head else {
      self.head = Node(withValue: toInsert)
      return
    }
    
    if head.value == key {
      let newHead = Node(withValue: toInsert)
      let temp = head
      self.head = newHead
      newHead.next = temp
      return
    }
    
    x = head
    var y = head.next
    
    while y != nil && y?.value != key {
      x = x?.next
      y = y?.next
    }
    
    let newNode = Node(withValue: toInsert)
    x?.next = newNode
    newNode.next = y
  }
  
  
  // Returns the first occurence of the spcified element in the list
  mutating func remove(_ item: T) {
    var x: Node<T>?
    guard let head = head else {
      return
    }
    
    if head.value == item {
      self.head = nil
      return
    }
    
    x = head
    var y = head.next
    while y != nil && y?.value != item {
      x = x?.next
      y = y?.next
    }
    
    let temp = y?.next
    x?.next = temp
  }
  
  
  func toString() -> String {
    var string = ""
    var x = head
    while  x != nil {
      string = string + "\(x?.value)"
      x = x?.next
    }
    return string
  }
  
}

extension LinkedList: Iterable {
  
  // Returns an array of the the items in the list
  func iterate() -> [T] {
    var array = [T]()
    guard let head = head else {
      return array
    }
    var x = head
    while x.next != nil  {
      array.append(x.value)
      x = x.next!
    }
    array.append(x.value)
    return array
  }
  
  // Return item at the given index
  subscript(index: Int) -> T? {
    return get(index)
  }
  
}
