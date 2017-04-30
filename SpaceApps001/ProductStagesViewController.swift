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

    var product: Product?
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
        if stages == nil{
            print("stages are nil")
        }
        dataSource = DataSource<ProductStagesTableViewCell, ProcessStage>(tableview: tableview, datas: stages!)
    }
    
    
    
    func createStages(){
        
        
        let stagesTitles = ["Feed",
                            "Farm",
                            "Processing",
                            "Packaging",
                            "Retail",
                            "End of Life"]
        
        self.stages = [ProcessStage]()
        
        
        if self.stages != nil{
        
            for a in 0 ... stagesTitles.count - 1{
                
                let newStage = ProcessStage(title: stagesTitles[a], weight: 0.0, waterUsage: 0.0, carbonFootprint: 0.0, wastage: 0.0)
                
                self.stages!.append(newStage)
            }
        }
        
    }
}
