//
//  StagesData.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/30/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import Foundation

enum DataStages: String {
    case Feed = "Feed"
    case Farm = "Farm"
    case Processing = "Processing"
    case Packaging = "Packaging"
    case Retail = "Retail"
    case Consumer = "Consumer"
    case EndOfLife = "End Of Life"
    case Total = "Total"
    
    static func all() -> [DataStages]{
        return [DataStages.Feed, DataStages.Farm, DataStages.Processing, DataStages.Packaging, DataStages.Retail, DataStages.Consumer, DataStages.EndOfLife, DataStages.Total]
    }
}

extension DataStages {
    var waterUsage: Double {
        switch self {
        case .Feed:
            return 392
        case .Farm:
            return 665
        case .Processing:
            return 1648
        case .Packaging:
            return 0
        case .Retail:
            return 0
        case .Consumer:
            return 0
        case .EndOfLife:
            return 0
        case .Total:
            return 2705
        }
    }
    
    var foodWastage: Double {
        switch self {
        case .Feed:
            return 0.1
        case .Farm:
            return 0.0
        case .Processing:
            return 0.0
        case .Packaging:
            return 0.0
        case .Retail:
            return 0.06
        case .Consumer:
            return 0.13
        case .EndOfLife:
            return 0.0
        case .Total:
            return 0.29
        }
    }
    
    var carbonFootprint: Double {
        switch self {
        case .Feed:
            return 2.45
        case .Farm:
            return 3.33
        case .Processing:
            return 1.7
        case .Packaging:
            return 0.7
        case .Retail:
            return 0.9
        case .Consumer:
            return 0.5
        case .EndOfLife:
            return 0
        case .Total:
            return 9.58
        }
    }
}
