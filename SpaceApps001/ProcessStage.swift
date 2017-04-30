//
//  ProcessStage.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/29/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import Foundation


class ProcessStage {
    
    var title: String?
    
    var weight: Double?
    var waterUsage: Double?
    var carbonFootprint: Double?
    var wastage: Double?
    
    init(title: String, weight: Double, waterUsage: Double, carbonFootprint: Double, wastage: Double){
        
        self.title = title
        self.weight = weight
        self.waterUsage = waterUsage
        self.carbonFootprint = carbonFootprint
        self.wastage = wastage
    }
}
