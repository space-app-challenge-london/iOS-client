//
//  LocationSelectionViewController.swift
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

class LocationSelectionViewController: UIViewController {

    private let bag = DisposeBag()

    private let listview = ListView<LocationSelectionTableViewCell, String>(datas: states)

    private var productSegue: AnyObserver<String> {
        return NavigationSegue(fromViewController: self.navigationController!,
                               toViewControllerFactory: { (sender, context) -> ProductSelectionViewController in
                                guard let productSelection = UIStoryboard.instanciate(storyboard: Storyboard.product,
                                                                                      identifier: ProductSelectionViewController.identifier) as? ProductSelectionViewController else {
                                    return ProductSelectionViewController()
                                }
                                productSelection.state = context
                                return productSelection
        }).asObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listview.reset()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🇺🇸 select a state"
        view.addSubview(listview)
        constrain(listview, view) { listview, view in
            listview.edges == view.edges
        }
        listview.modelSelect.bindTo(productSegue).addDisposableTo(bag)
    }
}
