//
//  MST.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/31/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class MST: NSObject {
  
  let graph: EdgeWeightedGraph

  init(withGraph G: EdgeWeightedGraph) {
    self.graph = G
    super.init()
    self.computeMST()
  }
  
  private func computeMST() {
    
  }
  
  func edges() -> [Edge<Int>] {
    return []
  }
  
}
