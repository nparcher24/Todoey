//
//  Item.swift
//  Todoey
//
//  Created by Nicholas Parrish on 11/29/18.
//  Copyright © 2018 Nicholas Parrish. All rights reserved.
//

import Foundation


class Item: NSObject {
    var title: String
    var isChecked = false
    
    init(startingTitle: String) {
        title = startingTitle
    }
}
