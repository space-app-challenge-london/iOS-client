//
//  ProductSelectionTableViewCell.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductSelectionTableViewCell: UITableViewCell, CellType {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageSelected: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func height(model: ProductSelection) -> CGFloat {
        return 90
    }

    func configure(model: ProductSelection) {
        imageProduct.image = model.image
        labelTitle.text = model.title
        imageSelected.isHidden = !model.selected
    }
}
