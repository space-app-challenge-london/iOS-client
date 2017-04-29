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

class LocationSelectionViewController: UIViewController {

    private let bag = DisposeBag()
    @IBOutlet weak var tableview: UITableView!

    private var dataSource: DataSource<LocationSelectionTableViewCell, String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🇺🇸 select a state"
        configureTableview()

        tableview.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let state = states[indexPath.row]
            self?.performSegue(withIdentifier: "selectProductSegue", sender: state)
        }).addDisposableTo(bag)
    }

    private func configureTableview() {
        tableview.registerCell(identifier: LocationSelectionTableViewCell.identifier)
        tableview.tableFooterView = UIView()
        dataSource = DataSource<LocationSelectionTableViewCell, String>(tableview: tableview, datas: states)
    }
}
