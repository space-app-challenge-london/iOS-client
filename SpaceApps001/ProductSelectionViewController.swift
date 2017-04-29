//
//  ProductSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class ProductSelectionViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    var state: String?

    var products = [Product]()
    private var dataSource: DataSource<ProductTableViewCell, Product>!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        products = Product.fake()
        configureTableview()
    }

    private func configureTableview() {
        tableview.registerCell(identifier: ProductTableViewCell.identifier)
        tableview.tableFooterView = UIView()
        tableview.delegate = self
        dataSource = DataSource<ProductTableViewCell, Product>(tableview: tableview, datas: products)
    }
}

extension ProductSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
