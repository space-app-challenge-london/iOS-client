//
//  Data.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import Foundation

enum DataFood: String {
    case Banana = "Banana"
    case Beef = "Beef"
    case Bread = "Bread"
    case Cabbage = "Cabbage"
    case Cheese = "Cheese"
    case Chicken = "Chicken"
    case Chocolate = "Chocolate"
    case Egg = "Egg"
    case Milk = "Milk"
    case Olive = "Olive"
    case Pancake = "Pancake"
    case Pig = "Pig"
    case Pizza = "Pizza"
    case Potato = "Potato"
    case Rice = "Rice"
    case Sheep = "Sheep"
    case Spaghetti = "Spaghetti"
    case Tomato = "Tomato"
}

extension DataFood {
    var waterUsage: Double {
        switch self {
        case .Banana:
            return 790
        case .Beef:
            return 15415
        case .Bread:
            return 1608
        case .Cabbage:
            return 237
        case .Cheese:
            return 3178
        case .Chicken:
            return 4325
        case .Chocolate:
            return 17196
        case .Egg:
            return 196
        case .Milk:
            return 1020
        case .Olive:
            return 3025
        case .Pancake:
            return 5553
        case .Pig:
            return 5988
        case .Pizza:
            return 1239
        case .Potato:
            return 287
        case .Rice:
            return 2497
        case .Sheep:
            return 10412
        case .Spaghetti:
            return 1849
        case .Tomato:
            return 214
        }
    }

    var carbonFootprint: Double {
        switch self {
        case .Banana:
            return 1.1
        case .Beef:
            return 27
        case .Bread:
            return 3.1
        case .Cabbage:
            return 0
        case .Cheese:
            return 13.5
        case .Chicken:
            return 6.9
        case .Chocolate:
            return 4
        case .Egg:
            return 4.8
        case .Milk:
            return 1.9
        case .Olive:
            return 0
        case .Pancake:
            return 7
        case .Pig:
            return 12.1
        case .Pizza:
            return 0
        case .Potato:
            return 2.9
        case .Rice:
            return 2.7
        case .Sheep:
            return 39.2
        case .Spaghetti:
            return 2.93
        case .Tomato:
            return 1.1
        }
    }

    var foodWastage: Double {
        switch self {
        case .Banana:
            return 29.3
        case .Beef:
            return 3.29
        case .Bread:
            return 29.29
        case .Cabbage:
            return 0
        case .Cheese:
            return 5.56
        case .Chicken:
            return 15.6
        case .Chocolate:
            return 0
        case .Egg:
            return 2.71
        case .Milk:
            return 0.3
        case .Olive:
            return 0
        case .Pancake:
            return 4.46
        case .Pig:
            return 6.25
        case .Pizza:
            return 0
        case .Potato:
            return 5.5
        case .Rice:
            return 4.25
        case .Sheep:
            return 0
        case .Spaghetti:
            return 0
        case .Tomato:
            return 0
        }
    }
}
