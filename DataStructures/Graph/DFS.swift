//
//  DFS.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/24/16.
//  Copyright © 2016 Enhatch. All rights reserved.
//

import UIKit

struct DFS {
  
  fileprivate var marked = [Bool]()
  
  fileprivate var edgeTo = [Int]()
  
  fileprivate let source: Int
  
  init(withGraph graph: Graph, Source s: Int) {
    self.source = s
    for _ in 0..<graph.V {
      marked.append(false)
    }
  }
  
  mutating func hasPathTo(graph G: Graph, v: Int) -> Bool {
    depthFirstSearch(graph: G, v: source)
    return marked[v]
  }
  
  mutating func depthFirstSearch(graph G: Graph, v: Int) {
    marked[v] = true
    
    for j in G.adjacent(vertex: v) {
      if !marked[j] {
        edgeTo[j] = v
        depthFirstSearch(graph: G, v: j)
      }
    }
  }
  
  mutating func pathTo(graph G: Graph, v: Int) -> [Int] {
    if !hasPathTo(graph: G, v: v) {
      return []
    }
    
    var array = [Int]()
    var stack = Stack<Int>()
    var x = v
    
    while edgeTo[x] != source {
      stack.push(edgeTo[v])
      x = edgeTo[v]
    }
    
    while !stack.isEmpty() {
      array.append(stack.pop()!)
    }
    return array
  }
  
}
