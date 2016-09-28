//
//  ShortestPaths.swift
//  DataStructures
//
//  Created by Sunayna Jain on 8/16/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class ShortestPaths: NSObject {
  
  let G: EdgeWeightedDigraph
  
  let s: Int
  
  init(withGraph G: EdgeWeightedDigraph, s: Int) {
    self.G = G
    self.s = s
  }
  
  func distanceTo(_ v: Int) -> Double {
    return 0
  }
  
  func pathTo(_ v: Int) -> [DirectedEdge<Int>] {
    return []
  }

}
