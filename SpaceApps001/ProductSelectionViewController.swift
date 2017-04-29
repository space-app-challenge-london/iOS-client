//
//  ProductSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductSelectionViewController: UIViewController {

    var state: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
    }
}
