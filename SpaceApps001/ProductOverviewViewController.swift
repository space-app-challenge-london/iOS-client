//
//  ProductOverviewViewController.swift
//  SpaceApps001
//
//  Created by Bratt Neumayer on 4/30/17.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSegue
import Cartography

class ProductOverviewViewController: UIViewController {

    @IBOutlet weak var wastageBarController: UIView!
    @IBOutlet weak var waterBarContainer: UIView!
    @IBOutlet weak var emissionBarContainer: UIView!
    @IBOutlet weak var stagesButton: UIButton!
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var emissionBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var waterBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var wastageBarWidthConstraint: NSLayoutConstraint!
    
    private let bag = DisposeBag()
    var headerImage: UIImage?
    var dataForFood = [DataStages]()
    
    var foodForOverview: DataFood?// = DataFood.Cheese
    
    
    private var showStagesSegue: AnyObserver<Void> {
        return NavigationSegue(fromViewController: self.navigationController!,
                               toViewControllerFactory: { (sender, context) -> ProductStagesViewController in
                                guard let productSelection = UIStoryboard.instanciate(storyboard: Storyboard.productStages,
                                                                                      identifier: ProductStagesViewController.identifier) as? ProductStagesViewController else {
                                                                                        return ProductStagesViewController()
                                }
                                
                                productSelection.dataStages = DataStages.all()
                                
                                return productSelection
        }).asObserver()
    }

    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.stagesButton.setCorners()
        self.emissionBarContainer.setCorners()
        self.wastageBarController.setCorners()
        self.waterBarContainer.setCorners()
        
        let totalBarWidth:CGFloat = self.waterBarContainer.bounds.width
        
        let emissionValue: CGFloat = CGFloat(foodForOverview!.carbonFootprint)
        let waterValue: CGFloat = CGFloat(foodForOverview!.waterUsage)
        let wastageValue: CGFloat = CGFloat(foodForOverview!.foodWastage)
        
        var emissionRelativity: CGFloat = 0
        var waterRelativity: CGFloat = 0
        var wastageRelativity: CGFloat = 0
        
        if emissionValue != CGFloat(0){
            
            emissionRelativity = 40 / emissionValue
        }
        
        if waterValue != CGFloat(0){
            
            waterRelativity = 17196 / waterValue
        }
        
        if wastageValue != CGFloat(0){
            
            wastageRelativity = 100 / wastageValue
        }
        
        
        if emissionValue != CGFloat(0){
            
            emissionBarWidthConstraint.constant = totalBarWidth / emissionRelativity
        }else{
            emissionBarWidthConstraint.constant = 0.0
        }
        
        if waterValue != CGFloat(0){
            
            waterBarWidthConstraint.constant = totalBarWidth / waterRelativity
        }else{
            waterBarWidthConstraint.constant = 0.0
        }
        
        if wastageValue != CGFloat(0){
            
            wastageBarWidthConstraint.constant = totalBarWidth / wastageRelativity
        }else{
            
            wastageBarWidthConstraint.constant = 0.0
        }
        
        self.headerImageView.image = UIImage(named: foodForOverview!.rawValue)
//        if self.headerImage != nil{
//            
//            self.headerImageView.image = UIImage(named: foodForOverview!.rawValue)//self.headerImage!
//        }
        
        stagesButton.rx.tap.bindTo(showStagesSegue).addDisposableTo(bag)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
