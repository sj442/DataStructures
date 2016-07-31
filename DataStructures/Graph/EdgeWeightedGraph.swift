//
//  EdgeWeightedGraph.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/31/16.
//  Copyright © 2016 LittleAuk. All rights reserved.


import UIKit

class EdgeWeightedGraph: NSObject {
  
  var adj: [Bag<Edge<Int>>]
  
  let V: Int
  
  init(withVertices V: Int) {
    self.V = V
    self.adj = [Bag<Edge<Int>>]()
    for i in 0..<V {
      adj[i] = Bag<Edge<Int>>()
    }
  }
  
  func addEdge(e: Edge<Int>) {
    let v = e.either()
    let w = e.other(v)
    adj[v].addItem(e)
    adj[w].addItem(e)
  }
  
  func adjacent(vertex v: Int) -> Bag<Edge<Int>> {
    return adj[v]
  }
  
  

}
