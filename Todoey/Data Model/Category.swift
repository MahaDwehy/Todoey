//
//  Category.swift
//  Todoey
//
//  Created by Maha AlDwehy on 24/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic  var name: String = ""
    let items = List<Item>()

}
