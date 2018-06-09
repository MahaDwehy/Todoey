//
//  File.swift
//  Todoey
//
//  Created by Maha AlDwehy on 24/09/1439 AH.
//  Copyright © 1439 Maha AlDwehy. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic  var name: String = ""
    @objc dynamic var age: Int = 0
}
