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
}
