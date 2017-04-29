//
//  ProductTableViewCell.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell, CellType {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func height(model: Model) -> CGFloat {
        return 90
    }

    func configure(model: Product) {
        self.imageProduct.image = model.image
        self.labelTitle.text = model.title
    }
}
