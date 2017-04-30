//
//  Recipe.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import RealmSwift

class ProductRecipe: Object {
    dynamic var title: String = ""
    dynamic var image: Data = Data()

    open override class func primaryKey() -> String? {
        return "title"
    }
}

class Recipe: Object {
    dynamic var uuid = UUID().uuidString
    dynamic var title: String = ""
    var products = List<ProductRecipe>()

    open override class func primaryKey() -> String? {
        return "uuid"
    }
}

extension Recipe {
    func save(realm: Realm = try! Realm()) {
        try! realm.write {
            realm.add(self, update: true)
        }
    }

    static func all(realm: Realm = try! Realm()) -> [Recipe] {
        return Array(realm.objects(Recipe.self))
    }
}
