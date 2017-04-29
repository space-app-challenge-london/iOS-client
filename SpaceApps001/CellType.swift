//
//  LocationSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

protocol CellType {
    associatedtype Model
    static var identifier: String {get}
    static func height(model: Model) -> CGFloat
    func configure(model: Model)
}

extension CellType {
    static var identifier: String {
        return NSStringFromClass(self as! AnyClass).components(separatedBy: ".").last ?? ""
    }
}
