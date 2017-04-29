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
    var lossInWeight: Double?
    var transportation: Double?
    var wastage: Double?
    var no2Emission: Double?
    var h2so4Emission: Double?
    var co2Emission: Double?
    
    init(title: String, weight: Double, lossInWeight: Double, transportation: Double, wastage: Double){
        
        self.title = title
        self.weight = weight
        self.lossInWeight = lossInWeight
        self.transportation = transportation
        self.wastage = wastage
    }
}
