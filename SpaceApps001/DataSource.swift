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

    var datas: [T] {
        didSet {
            tableview.reloadData()
        }
    }
    
    init(tableview: UITableView, datas: [T] = []) {
        self.datas = datas
        self.tableview = tableview
        super.init()
        self.tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: C.identifier) as? C else {
            return UITableViewCell()
        }
        cell.configure(model: datas[indexPath.row])
        return cell as! UITableViewCell
    }
}
