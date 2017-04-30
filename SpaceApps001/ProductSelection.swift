//
//  ProductSelection.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductSelection {
    var image: UIImage
    var title: String
    var selected: Bool = false

    init(image: UIImage, title: String) {
        self.image = image
        self.title = title
    }
}

extension ProductSelection {
    static func recipies() -> [ProductSelection] {
        return [
            ProductSelection(image: UIImage(named: "Banana")!, title: "Banana"),
            ProductSelection(image: UIImage(named: "Beef")!, title: "Beef"),
            ProductSelection(image: UIImage(named: "Bread")!, title: "Bread"),
            ProductSelection(image: UIImage(named: "Cabbage")!, title: "Cabbage"),
            ProductSelection(image: UIImage(named: "Cheese")!, title: "Cheese"),
            ProductSelection(image: UIImage(named: "Chicken")!, title: "Chicken"),
            ProductSelection(image: UIImage(named: "Chocolate")!, title: "Chocolate"),
            ProductSelection(image: UIImage(named: "Egg")!, title: "Egg"),
            ProductSelection(image: UIImage(named: "Milk")!, title: "Milk"),
            ProductSelection(image: UIImage(named: "Olive")!, title: "Olive"),
            ProductSelection(image: UIImage(named: "Pancake")!, title: "Pancake"),
            ProductSelection(image: UIImage(named: "Pig")!, title: "Pig"),
            ProductSelection(image: UIImage(named: "Pizza")!, title: "Pizza"),
            ProductSelection(image: UIImage(named: "Potato")!, title: "Potato"),
            ProductSelection(image: UIImage(named: "Rice")!, title: "Rice"),
            ProductSelection(image: UIImage(named: "Sheep")!, title: "Sheep"),
            ProductSelection(image: UIImage(named: "Spaghetti")!, title: "Spaghetti"),
            ProductSelection(image: UIImage(named: "Tomato")!, title: "Tomato")
        ]
    }
}
