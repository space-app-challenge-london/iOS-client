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
    
    private let bag = DisposeBag()
    
    
    private var showStagesSegue: AnyObserver<Void> {
        return NavigationSegue(fromViewController: self.navigationController!,
                               toViewControllerFactory: { (sender, context) -> ProductStagesViewController in
                                guard let productSelection = UIStoryboard.instanciate(storyboard: Storyboard.productStages,
                                                                                      identifier: ProductStagesViewController.identifier) as? ProductStagesViewController else {
                                                                                        return ProductStagesViewController()
                                }
                                
                                return productSelection
        }).asObserver()
    }

    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        self.stagesButton.setCorners()
        self.emissionBarContainer.setCorners()
        self.wastageBarController.setCorners()
        self.waterBarContainer.setCorners()
        
        
        
//        stagesButton.addTarget(self, action: #selector(goToStages), for: .touchUpInside)
//        stagesButton.rx.tap.subscribe(onNext: { [weak self]  in
//            
//            self?.performSegue(withIdentifier: "showStagesSegue", sender: self)
//        }).addDisposableTo(bag)
        
        stagesButton.rx.tap.bindTo(showStagesSegue).addDisposableTo(bag)
        
        
        
        
        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goToStages(){
        
        self.performSegue(withIdentifier: "showStagesSegue", sender: self)
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
