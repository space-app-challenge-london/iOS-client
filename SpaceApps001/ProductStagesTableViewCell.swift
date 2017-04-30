//
//  ProductStagesTableViewCell.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/29/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductStagesTableViewCell: UITableViewCell, CellType {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var transportationLabel: UILabel!
    @IBOutlet weak var lossInWeightLabel: UILabel!
    @IBOutlet weak var wastageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    static func height(model: ProcessStage) -> CGFloat {
        return 44
    }
    
    func configure(model: ProcessStage) {
        self.titleLabel.text = model.title
        self.weightLabel.text = String.init(format: "%.2f", model.weight!)
        self.transportationLabel.text = String.init(format: "%.2f", model.carbonFootprint!)
        self.lossInWeightLabel.text = String.init(format: "%.2f", model.waterUsage!)
        self.wastageLabel.text = String.init(format: "%.2f", model.wastage!)
    }
    
}
