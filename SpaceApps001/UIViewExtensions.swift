//
//  UIViewExtensions.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/30/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func setCorners(){
        self.layer.cornerRadius = self.bounds.height / 2
        self.layer.masksToBounds = true
        
    }
}
