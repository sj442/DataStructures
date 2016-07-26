//
//  Node.swift
//  DataStructures
//
//  Created by Sunayna Jain on 7/24/16.
//  Copyright © 2016 LittleAuk. All rights reserved.
//

import UIKit

class Node<T>: NSObject {
  
  let value: T
  
  var next: Node?
  
  init(withValue value: T) {
    self.value = value
  }

}
