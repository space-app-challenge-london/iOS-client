//
//  LocationSelectionTableViewCell.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class LocationSelectionTableViewCell: UITableViewCell, CellType {

    @IBOutlet weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(model: String) {
        label.text = model
    }
}
