//
//  Edge.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/31/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class Edge<T: Comparable>: NSObject {

  let weight: Double
  
  let v: T
  let w: T
  
  
  init(v: T, w: T, weight: Double) {
    self.v = v
    self.w = w
    self.weight = weight
  }
  
  func either() -> T {
    return v
  }
  
  func other(x: T) -> T {
    if x == v {
      return w
    }
    return v
  }
  
  func compareTo(edge: Edge) -> Int {
    if weight < edge.weight {
      return -1
    } else if weight > edge.weight {
      return 1
    }
    return 0
  }
  
}
