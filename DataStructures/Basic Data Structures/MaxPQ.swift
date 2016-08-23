//
//  MaxPQ.swift
//  DataStructures
//
//  Created by Sunayna Jain on 8/18/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

struct MaxPQ<T: Comparable> {
  
  var array: [T]
  
  init(capacity: Int) {
    self.array = [T]()
  }

  mutating func insert(key: T) {
    let count = array.count
    array[count + 1] = key
    swim(array.count)
  }
  
  mutating func delMax() -> T? {
    if isEmpty() {
      return nil
    }
    let max = array[1]
    let count = array.count
    exchange(1, index2: count)
    array.removeAtIndex(count)
    sink(1)
    return max
  }
  
  func isEmpty() -> Bool {
    return array.count == 0
  }
  
  func max() -> T? {
    if isEmpty() {
      return nil
    }
    return array[1]
  }
  
  func size() -> Int {
    return array.count
  }
  
  private mutating func swim(k: Int) {
    var index = k
    while index > 1 && (array[index] > array[index/2]) {
      exchange(index, index2: index/2)
      index = index/2
    }
  }
  
  private mutating func sink(k: Int) {
    var index = k
    while index < array.count && array[index] < min(array[2 * index], array[2 * index + 1]) {
      let j = array[ 2 * index] > array[ 2 * index + 1] ? 2 * index : 2 * index + 1
      exchange(index, index2: j)
      index = j
    }
  }
  
  private mutating func exchange(index1: Int, index2: Int) {
    let i1 = array[index1]
    let i2 = array[index2]
    array[index1] = i2
    array[index2] = i1
  }
  
}
