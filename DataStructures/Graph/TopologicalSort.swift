//
//  TopologicalSort.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/30/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

struct TogologicalSort<T: Equatable> {
  
  var stack: Stack<Int>
  
  var marked = [Bool]()
  
  init(withDigraph G: Digraph) {
    self.stack = Stack(first: nil, numberOfObjects: G.V)
    for _ in 0..<G.V {
      marked.append(false)
    }
    sort(G)
  }
  
  mutating func sort(G: Digraph) {
    for v in 0..<G.V {
      if !marked[v] {
        var dfs = DFS(withGraph: G, Source: v)
        dfs.depthFirstSearch(graph: G, v: v)
        stack.push(v)
      }
    }
  }
  
  func sorted() -> [Int] {
    return stack.iterate()
  }
  
  
}
