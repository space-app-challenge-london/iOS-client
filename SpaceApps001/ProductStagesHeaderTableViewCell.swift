//
//  ProductStagesHeaderTableViewCell.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/30/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductStagesHeaderTableViewCell: UITableViewCell, CellType {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static func height(model: ProcessStage) -> CGFloat {
        return 44
    }
    
    func configure(model: ProcessStage) {
    }
    
}
