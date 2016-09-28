//
//  ConnectedComponents.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/26/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

struct ConnectedComponents {
  
  // number of connected components
  var count = 0
  
  var id = [Int]()
  
  var marked = [Bool]()
  
  init(withGraph G: Graph) {
    for _ in 0..<G.V {
      marked.append(false)
    }
    getConnectedComponents(graph: G)
  }
  
  mutating func getConnectedComponents(graph G: Graph) {
    for i in 0..<G.V {
      if !marked[i] {
        marked[i] = true
        var dfs = DFS(withGraph: G, Source: i)
        dfs.depthFirstSearch(graph: G, v: i)
        id[i] = count
        count += 1
      }
    }
  }
  
  // Return true if v and w are in the same connected component
  func connected(_ v: Int, w: Int) -> Bool {
    return id[v] == id[w]
  }
  
  // Returns the connected graph the vertex belongs to. Connected vertices will belong to the same graph, and return the same id. Connected query can be done in constant time
  func id(_ v: Int) -> Int {
    return 0
  }

}
