//
//  MyCompositionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import RxSwift
import Cartography
import RealmSwift
import RxRealm
import RxSegue

class MyCompositionViewController: UIViewController {

    private let bag = DisposeBag()
    private let listview = ListView<CompositionTableViewCell, Recipe>()
    private var token: NotificationToken!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listview.source.datas = Recipe.all()
    }
    
    
    private var productOverviewSegue: AnyObserver<Recipe> {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My recipies"


        listview.modelSelect.bindTo(productOverviewSegue).addDisposableTo(bag)
        
        
        token = (try! Realm()).addNotificationBlock { [weak self] _, _ in
            self?.listview.source.datas = Recipe.all()
        }

        view.addSubview(listview)
        view.sendSubview(toBack: listview)
        constrain(listview, view) { listview, view in
            listview.edges == view.edges
        }
        listview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
}
