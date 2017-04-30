//
//  LocationSelectionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit

class DataSource<C, T>: NSObject, UITableViewDataSource where C: CellType, T == C.Model {

    private let tableview: UITableView
    private var cells: [C.Type]?
    
    var datas: [T] {
        didSet {
            tableview.reloadData()
        }
    }
    
    init(tableview: UITableView, datas: [T] = [], cells: [C.Type]? = nil) {
        self.datas = datas
        self.tableview = tableview
        self.cells = cells
        super.init()
        self.tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("datas : \(datas)")
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cells?[indexPath.row].identifier ?? C.identifier) as? C else {
            return UITableViewCell()
        }
        cell.configure(model: datas[indexPath.row])
        return cell as! UITableViewCell
    }
}
