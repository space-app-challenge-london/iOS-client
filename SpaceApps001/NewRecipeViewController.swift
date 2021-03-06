//
//  NewRecipeViewController.swift
//  SpaceApps001
//
//  Created by Remi Robert on 30/04/2017.
//  Copyright © 2017 Bratt Neumayer. All rights reserved.
//

import UIKit
import Cartography
import RxSwift
import RxSegue
import RealmSwift

class NewRecipeViewController: UIViewController {

    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var containerView: UIView!

    private let bag = DisposeBag()
    private let listview = ListView<ProductSelectionTableViewCell, ProductSelection>(datas: ProductSelection.recipies())

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textfieldName.becomeFirstResponder()
    }

    @objc private func save() {
        let newRecipe = Recipe()
        newRecipe.title = textfieldName.text!

        let selectedProducts = listview.source.datas.filter { $0.selected }
        let products = selectedProducts.map { product -> ProductRecipe in
            let newProduct = ProductRecipe()
            newProduct.title = product.title
            newProduct.image = UIImagePNGRepresentation(product.image)!
            return newProduct
        }
        newRecipe.products = List<ProductRecipe>(products)
        newRecipe.save()
        self.dismiss(animated: true, completion: nil)
    }

    private func updateUI() {
        let count = listview.source.datas.filter { $0.selected }.count
        if textfieldName.text == nil || textfieldName!.text!.isEmpty || count == 0 {
            navigationItem.rightBarButtonItem = nil
            return
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.save))
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textfieldName.delegate = self
        listview.backgroundColor = UIColor.clear
        containerView.addSubview(listview)
        constrain(listview, containerView) { listview, containerView in
            listview.edges == containerView.edges
        }

        textfieldName.rx.text.subscribe(onNext: { [weak self] _ in
            self?.updateUI()
        }).addDisposableTo(bag)

        listview.modelSelect.subscribe(onNext: { [weak self] product in
            product.selected = !product.selected
            self?.listview.reloadData()
            self?.updateUI()
        }).addDisposableTo(bag)
        
        
    }
}

extension NewRecipeViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == "\n" {
            textfieldName.resignFirstResponder()
            return false
        }
        return true
    }
}
