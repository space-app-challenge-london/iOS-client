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
    @IBOutlet weak var no2Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func configure(model: ProcessStage) {
        
        
        self.titleLabel.text = model.title
        self.weightLabel.text = String.init(format: "%.2f", model.weight!)
        self.transportationLabel.text = String.init(format: "%.2f", model.transportation!)
        self.lossInWeightLabel.text = String.init(format: "%.2f", model.lossInWeight!)
        self.wastageLabel.text = String.init(format: "%.2f", model.wastage!)
//        self.no2Label.text = String.init(format: "%.2f", model.no2Emission!)
    }
    
}
