//
//  Product.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

struct Product {
    var image: UIImage
    var title: String

    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

extension Product {
    static func fake() -> [Product] {
        return [
            Product(image: UIImage(named: "Cheese")!, title: "Cheese"),
            Product(image: UIImage(named: "Beef")!, title: "Beef")
        ]
    }

    static func all() -> [Product] {
        return [
            Product(image: UIImage(named: "Banana")!, title: "Banana"),
            Product(image: UIImage(named: "Beef")!, title: "Beef"),
            Product(image: UIImage(named: "Bread")!, title: "Bread"),
            Product(image: UIImage(named: "Cabbage")!, title: "Cabbage"),
            Product(image: UIImage(named: "Cheese")!, title: "Cheese"),
            Product(image: UIImage(named: "Chicken")!, title: "Chicken"),
            Product(image: UIImage(named: "Chocolate")!, title: "Chocolate"),
            Product(image: UIImage(named: "Egg")!, title: "Egg"),
            Product(image: UIImage(named: "Milk")!, title: "Milk"),
            Product(image: UIImage(named: "Olive")!, title: "Olive"),
            Product(image: UIImage(named: "Pancake")!, title: "Pancake"),
            Product(image: UIImage(named: "Pig")!, title: "Pig"),
            Product(image: UIImage(named: "Pizza")!, title: "Pizza"),
            Product(image: UIImage(named: "Potato")!, title: "Potato"),
            Product(image: UIImage(named: "Rice")!, title: "Rice"),
            Product(image: UIImage(named: "Sheep")!, title: "Sheep"),
            Product(image: UIImage(named: "Spaghetti")!, title: "Spaghetti"),
            Product(image: UIImage(named: "Tomato")!, title: "Tomato")
        ]
    }
}
