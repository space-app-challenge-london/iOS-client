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

class LocationSelectionViewController: UIViewController {

    private let bag = DisposeBag()
    @IBOutlet weak var tableview: UITableView!

    private var dataSource: DataSource<LocationSelectionTableViewCell, String>!

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
        guard let indexPathSelected = tableview.indexPathForSelectedRow else {return}
        tableview.deselectRow(at: indexPathSelected, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🇺🇸 select a state"
        configureTableview()

        tableview.rx.itemSelected.flatMap({ indexPath in
            return Observable.just(states[indexPath.row])
        }).bindTo(productSegue).addDisposableTo(bag)
    }

    private func configureTableview() {
        tableview.registerCell(identifier: LocationSelectionTableViewCell.identifier)
        tableview.tableFooterView = UIView()
        dataSource = DataSource<LocationSelectionTableViewCell, String>(tableview: tableview, datas: states)
    }
}
