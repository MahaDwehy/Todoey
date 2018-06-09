//
//  Items.swift
//  Todoey
//
//  Created by Maha AlDwehy on 24/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic  var title: String = ""
    @objc dynamic var checked: Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
