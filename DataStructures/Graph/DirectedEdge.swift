//
//  DirectedEdge.swift
//  DataStructures
//
//  Created by Sunayna Jain on 8/16/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

class DirectedEdge<T: Comparable>: NSObject {
  
  let v: T
  
  let w: T
  
  let weight: Double
  
  init(with v: T, w: T, weight: Double) {
    self.v = v
    self.w = w
    self.weight = weight
  }
  
  func from() -> T {
    return v
  }
  
  func to() -> T {
    return w
  }


}
