//
//  Item.swift
//  ShoppingList
//
//  Created by Mykhailo Bondarenko on 15.03.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import Foundation
import UIKit

class Item {
    var name: String
    var isChecked: Bool
    
    init(name: String, isChecked: Bool = false) {
        self.name = name
        self.isChecked = isChecked
    }
    
    static func fake(_ count: Int) -> [Item] {
        var items = [Item]()
          for i in 0...count {
            let item = Item(name: "Item \(i)", isChecked: i % 2 == 0)
            items.append(item)
          }
          return items
    }
}
