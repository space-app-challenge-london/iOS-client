//
//  LocationSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class LocationSelectionViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!

    private var dataSource: DataSource<LocationSelectionTableViewCell, String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🇺🇸 select a state"
        configureTableview()
    }

    private func configureTableview() {
        tableview.registerCell(identifier: LocationSelectionTableViewCell.identifier)
        tableview.tableFooterView = UIView()
        dataSource = DataSource<LocationSelectionTableViewCell, String>(tableview: tableview, datas: states)
    }
}
