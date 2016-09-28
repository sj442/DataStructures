//
//  EdgeWeightedDigraph.swift
//  DataStructures
//
//  Created by Sunayna Jain on 8/16/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

class EdgeWeightedDigraph: NSObject {
  
  var adj: [Bag<DirectedEdge<Int>>]
  
  let V: Int
  

  init(withVertices V:Int) {
    self.V = V
    self.adj = [Bag<DirectedEdge<Int>>]()
    for i in 0..<V {
      self.adj[i] =  Bag<DirectedEdge<Int>>()
    }
  }
  
  func adjacent(vertext v: Int) -> Bag<DirectedEdge<Int>>{
    return adj[v]
  }
  
  func addEdge(_ edge: DirectedEdge<Int>) {
    let v = edge.from()
    adj[v].addItem(edge)
  }

  
}
