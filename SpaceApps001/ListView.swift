//
//  ListViewViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 29/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import Cartography
import RxSwift
import RxCocoa

class ListView<C, M>: UITableView, UITableViewDelegate where  C: CellType, M == C.Model {

    var modelSelect: Observable<M> {
        return self.rx.itemSelected.flatMap({ indexPath in
            return Observable.just(self.source.datas[indexPath.row])
        })
    }

    private var source: DataSource<C, M>!

    private func comonInit(datas: [M] = []) {
        source = DataSource<C, M>(tableview: self, datas: datas)
        configureTableView()
    }

    init(datas: [M] = []) {
        super.init(frame: CGRect.zero, style: .plain)
        comonInit(datas: datas)
    }

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        comonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func configureTableView() {
        self.registerCell(identifier: C.identifier)
        tableFooterView = UIView()
        delegate = self
    }

    open func reset() {
        guard let indexPath = indexPathForSelectedRow else {return}
        deselectRow(at: indexPath, animated: false)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = source.datas[indexPath.row]
        return C.height(model: model)
    }
}
