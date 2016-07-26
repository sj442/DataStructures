//
//  Iterable.swift
//  DataStructures
//
//  Created by Sunayna Jain on 2/22/16.
//  Copyright © 2016 Enhatch. All rights reserved.
//

import Foundation

protocol Iterable {
  
  associatedtype ItemType
  func iterate() -> [ItemType]
  subscript(index: Int) -> ItemType? {get}
}
