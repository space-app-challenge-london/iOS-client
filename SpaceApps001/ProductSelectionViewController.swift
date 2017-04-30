//
//  ProductSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSegue
import Cartography

class ProductSelectionViewController: UIViewController {

    var state: String?

    private let bag = DisposeBag()
    private let listview = ListView<ProductTableViewCell, Product>(datas: Product.fake())
    
    private var productStagesSegue: AnyObserver<Product> {
        return NavigationSegue(fromViewController: self.navigationController!,
                               toViewControllerFactory: { (sender, context) -> ProductOverviewViewController in
                                guard let productSelection = UIStoryboard.instanciate(storyboard: Storyboard.productOverview,
                                                                                      identifier: ProductOverviewViewController.identifier) as? ProductOverviewViewController else {
                                                                                        return ProductOverviewViewController()
                                }
                                
                                productSelection.headerImage = #imageLiteral(resourceName: "Cheese")
                                return productSelection
        }).asObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Foods"
        listview.reset()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        view.addSubview(listview)
        constrain(listview, view) { listview, view in
            listview.edges == view.edges
        }
        listview.modelSelect.bindTo(productStagesSegue).addDisposableTo(bag)
    }
    
}
