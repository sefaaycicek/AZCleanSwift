//
//  ProductListViewController.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

protocol ProductDisplayLogic : AnyObject {
    func displayList(viewModel : ProductList.List.ViewModel)
}

class ProductListViewController: UIViewController, ProductDisplayLogic {

    @IBOutlet weak var tableView : UITableView!
    
    let cellIdentifier = "FlightCellTableViewCell"
    var rows = [ProductList.Rows]()
    
    var interactor : ProductListBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "FlightCellTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: cellIdentifier)
        
        getList()
    }

    func displayList(viewModel: ProductList.List.ViewModel) {
        rows = viewModel.rows
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func getList() {
        let request = ProductList.List.Request(pageIndex: 1, pageItemCount: 10)
        interactor?.getList(request: request)
    }
}



extension ProductListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = rows[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: data.identifier(), for: indexPath) as? FlightCellProtocol {
            
            switch data {
                case .empty:
                break
            case .product(let product):
                cell.configure(flightData: product)
                break
            }
            
            return cell as! UITableViewCell
        }
        
        return UITableViewCell()
        
    }
    
    
}
