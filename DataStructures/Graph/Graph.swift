//
//  Graph.swift
//  DataStructures
//
//  Created by Sunayna Jain on 2/19/16.
//  Copyright © 2016 Enhatch. All rights reserved.


//DFS
//BFS
//Connected components
//Paths from from vertex to another
//bipartite
//detect a cycle in a graph
//is there a cycle which uses each edge exactly once

import UIKit

class Graph: NSObject {
  
  let V: Int
  var adj: [Bag<Int>]
  
  init(withVertices V: Int) {
    self.V = V
    self.adj = [Bag<Int>]()
    for v in 0..<V {
      adj[v] = Bag<Int>()
    }
  }
  
  static func degree(graph g: Graph, vertex v: Int) -> Int {
    return g.adjacent(vertex: v).size()
  }
  
  static func maxDegree(graph g: Graph) -> Int {
    var maxDegree = 0
    for v in 0..<g.vertices() {
      if maxDegree < degree(graph: g, vertex: v) {
        maxDegree = degree(graph: g, vertex: v)
      }
    }
    return maxDegree
  }
  
  static func averageDegree(graph g: Graph) -> Int {
    return 2 * (g.edges()/g.vertices())
  }
  
  static func numberOfSelfLoops(graph g: Graph) -> Int {
    var count = 0
    for v in 0..<g.vertices() {
      for w in g.adjacent(vertex: v) {
        if v == w {
          count += 1
        }
      }
    }
    return count/2
  }
  
  func addEdge(v: Int, w: Int) {
    adj[v].addItem(w)
    adj[w].addItem(v)
  }
  
  func adjacent(vertex v: Int) -> Bag<Int> {
    return adj[v]
  }
  
  func vertices() -> Int {
    return V
  }
  
  func edges() -> Int {
    var count = 0
    for v in 0..<V {
      count += adj[v].size()
    }
    return count/2
  }

  func iterate() {
    for v in  0..<vertices() {
      for w in adjacent(vertex: v) {
        print("\(v) - \(w)")
      }
    }
  }

}
