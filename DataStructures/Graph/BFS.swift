//
//  BFS.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/24/16.
//  Copyright © 2016 Enhatch. All rights reserved.
//

import UIKit

struct BFS {
  
  private var marked = [Bool]()
  
  private var edgeTo = [Int]()
  
  private let source: Int
  
  init(withGraph graph: Graph, Source s: Int) {
    self.source = s
    for _ in 0..<graph.V {
      marked.append(false)
    }
  }
  
  mutating func hasPathTo(graph G: Graph, v: Int) -> Bool {
    breadthFirstSearch(graph: G, v: v)
    
    return marked[v]
  }
  
  mutating func breadthFirstSearch(graph G: Graph, v: Int) {
    var queue = Queue<Int>()
    queue.enqueue(v)
    marked[v] = true

    while !queue.isEmpty() {
      let x = queue.dequeue()!
      for j in G.adjacent(vertex: x) {
        if !marked[j] {
          edgeTo[j] = x
          marked[j] = true
          queue.enqueue(j)
        }
      }
    }
  }
  
  
}
