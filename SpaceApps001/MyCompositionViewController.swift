//
//  MyCompositionViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import RxSwift
import Cartography
import RealmSwift
import RxRealm

class MyCompositionViewController: UIViewController {

    private let bag = DisposeBag()
    private let listview = ListView<CompositionTableViewCell, Recipe>()
    private var token: NotificationToken!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listview.source.datas = Recipe.all()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My recipies"


        token = (try! Realm()).addNotificationBlock { [weak self] _, _ in
            self?.listview.source.datas = Recipe.all()
        }

        view.addSubview(listview)
        view.sendSubview(toBack: listview)
        constrain(listview, view) { listview, view in
            listview.edges == view.edges
        }
        listview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
    }
}
