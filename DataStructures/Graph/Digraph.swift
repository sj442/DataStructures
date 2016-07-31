//
//  Digraph.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/28/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

// Topological sort using DFS
// Cycle detection using DFS

class Digraph: Graph {
  
  // Adds edge from v to w
  override func addEdge(v: Int, w: Int) {
    adj[v].addItem(w)
  }
  
  // Reverse of this digraph
  func reverse() -> Digraph {
    let reverse = Digraph(withVertices: V)
    
    for v in 0..<V {
      for j in adj[v] {
        reverse.addEdge(j, w: v)
      }
    }
    return reverse
  }
  
  // String representation
  func toString() {
    for i in 0..<V {
      for j in adj[i] {
        print("\(i) -> \(j)")
      }
    }
  }
  
}
