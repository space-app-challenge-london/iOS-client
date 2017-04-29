//
//  FirstViewController.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/29/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import AEXML



class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.extractXMLData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func extractXMLData(){
//        
//        guard let xmlPath = Bundle.main.path(forResource: "example", ofType: "xml")
//            let data = try? Data(contentsOf: URL(fileURLWithPath: xmlPath))
//            else { return }
        
        
        let xmlPath = Bundle.main.path(forResource: "001", ofType: "xml")
        
        if xmlPath != nil{
            print("not nil")
        }else{
//            print("xmlPath: \(xmlPath)")
        }
        
        
        let data = try? Data(contentsOf: URL(fileURLWithPath: xmlPath!))
        
        do {
            let xmlDoc = try AEXMLDocument(xml: data!, options: AEXMLOptions())
            
            // prints the same XML structure as original
//            print(xmlDoc.xml)
            
            // prints cats, dogs
            for child in xmlDoc.root.children {
                print(child.name)
            }
            
            // prints Optional("Tinna") (first element)
            print(xmlDoc.root["dataset"]["flowData"]["exchange"].all!.count )
            
            for exchange in xmlDoc.root["dataset"]["flowData"]["exchange"].all! {
                if let category = exchange.attributes["category"] {
                    print("exhange category: \(category)")
                }
            }
            
            
//            
//            // prints Tinna (first element)
//            print(xmlDoc.root["cats"]["cat"].string)
//            
//            // prints Optional("Kika") (last element)
//            print(xmlDoc.root["dogs"]["dog"].last?.value ?? "ASDFA ASFD ASFD")
//            
//            // prints Betty (3rd element)
//            print(xmlDoc.root["dogs"].children[2].string)
//            
//            // prints Tinna, Rose, Caesar
//            if let cats = xmlDoc.root["cats"]["cat"].all {
//                for cat in cats {
//                    if let name = cat.value {
//                        print(name)
//                    }
//                }
//            }
//            
//            // prints Villy, Spot
//            for dog in xmlDoc.root["dogs"]["dog"].all! {
//                if let color = dog.attributes["color"] {
//                    if color == "white" {
//                        print(dog.string)
//                    }
//                }
//            }
//            
//            // prints Tinna
//            if let cats = xmlDoc.root["cats"]["cat"].all(withValue: "Tinna") {
//                for cat in cats {
//                    print(cat.string)
//                }
//            }
//            
//            // prints Caesar
//            if let cats = xmlDoc.root["cats"]["cat"].all(withAttributes: ["breed" : "Domestic", "color" : "yellow"]) {
//                for cat in cats {
//                    print(cat.string)
//                }
//            }
//            
//            // prints 4
//            print(xmlDoc.root["cats"]["cat"].count)
//            
//            // prints Siberian
//            print(xmlDoc.root["cats"]["cat"].attributes["breed"]!)
//            
//            // prints <cat breed="Siberian" color="lightgray">Tinna</cat>
//            print(xmlDoc.root["cats"]["cat"].xmlCompact)
//            
//            // prints Optional(AEXML.AEXMLError.elementNotFound)
//            print(xmlDoc["NotExistingElement"].error)
        }
        catch {
            print("\(error)")
        }
    }


}

