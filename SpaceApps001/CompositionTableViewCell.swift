
//
//  CompositionTableViewCell.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class CompositionTableViewCell: UITableViewCell, CellType {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelCountProducts: UILabel!

    override func awakeFromNib() {
        labelCountProducts.layer.cornerRadius = 15
        super.awakeFromNib()
    }

    static func height(model: Recipe) -> CGFloat {
        return 50
    }

    func configure(model: Recipe) {
        labelTitle.text = model.title
        labelCountProducts.text = "\(model.products.count)"
    }
}
