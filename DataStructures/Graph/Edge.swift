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
  
  let v: Int
  let w: Int
  
  
  init(v: Int, w: Int, weight: Double) {
    self.v = v
    self.w = w
    self.weight = weight
  }
  
  func either() -> Int {
    return v
  }
  
  func other(x: Int) -> Int {
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
