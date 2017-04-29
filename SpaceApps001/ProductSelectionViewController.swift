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

class ProductSelectionViewController: UIViewController {

    private let bag = DisposeBag()
    @IBOutlet weak var tableview: UITableView!
    var state: String?

    var products = [Product]()
    private var dataSource: DataSource<ProductTableViewCell, Product>!

    private var productStagesSegue: AnyObserver<String> {
        return NavigationSegue(fromViewController: self.navigationController!,
                               toViewControllerFactory: { (sender, context) -> ProductStagesViewController in
                                guard let productSelection = UIStoryboard.instanciate(storyboard: Storyboard.productStages,
                                                                                      identifier: ProductStagesViewController.identifier) as? ProductStagesViewController else {
                                                                                        return ProductStagesViewController()
                                }
//                                productSelection.state = context
                                return productSelection
        }).asObserver()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = state
        products = Product.fake()
        configureTableview()
        
        tableview.rx.itemSelected.flatMap({ indexPath in
            return Observable.just(states[indexPath.row])
        }).bindTo(productStagesSegue).addDisposableTo(bag)
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
