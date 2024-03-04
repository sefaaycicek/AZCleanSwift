//
//  ViewController.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

protocol ProductDisplayLogic : AnyObject {
    func displayList(viewModel : ProductList.List.ViewModel)
}

class ViewController: UIViewController, ProductDisplayLogic {

    var interactor : ProductListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getList()
    }

    func displayList(viewModel: ProductList.List.ViewModel) {
        // table reload
    }
    
    func getList() {
        let request = ProductList.List.Request(pageIndex: 1, pageItemCount: 10)
        interactor?.getList(request: request)
    }

}

