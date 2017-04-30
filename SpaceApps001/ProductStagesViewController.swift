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

class ProductStagesViewController: UIViewController {
    
    private let bag = DisposeBag()
    @IBOutlet weak var tableview: UITableView!
    
    private var dataSource: DataSource<ProductStagesTableViewCell, ProcessStage>!

    var datasFood = [DataFood]()

    private var stages: [ProcessStage]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Stages"
        
        configureTableview()
        
        tableview.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            let state = states[indexPath.row]
            self?.performSegue(withIdentifier: "selectProductSegue", sender: state)
        }).addDisposableTo(bag)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.createStages()
    }
    
    private func configureTableview() {
        
        tableview.registerCell(identifier: ProductStagesTableViewCell.identifier)
        tableview.tableFooterView = UIView()
        self.createStages()
        
        dataSource = DataSource<ProductStagesTableViewCell, ProcessStage>(tableview: tableview, datas: stages!)
    }
    
    func createStages() {
        stages = datasFood.map({
            return ProcessStage(title: $0.rawValue, weight: 1, waterUsage: $0.waterUsage, carbonFootprint: $0.carbonFootprint, wastage: $0.foodWastage)
        })
    }
    
    
    
}
