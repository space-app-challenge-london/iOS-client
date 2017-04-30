//
//  Storyboard.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

struct Storyboard {
    static let location = UIStoryboard(name: "LocationSelection", bundle: nil)
    static let product = UIStoryboard(name: "ProductSelection", bundle: nil)
    static let productStages = UIStoryboard(name: "ProductStages", bundle: nil)
    static let productOverview = UIStoryboard(name: "ProductOverview", bundle: nil)
}

extension UIViewController {
    static var identifier: String {
        return NSStringFromClass(self as AnyClass).components(separatedBy: ".").last ?? ""
    }
}

extension UIStoryboard {
    class func instanciate(storyboard: UIStoryboard, identifier: String) -> UIViewController? {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
}
