//
//  ProductListPresenter.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

protocol ProductListPresentationLogic {
    func present(response : ProductList.List.Response)
}

class ProductListPresenter: ProductListPresentationLogic {
    
    weak var viewController : ProductDisplayLogic?
    
    func present(response: ProductList.List.Response) {
        var cells : [ProductList.Rows] = []
        
        let flights = response.flightDetailResponse?.flights.departure
        if flights?.isEmpty == true {
            cells.append(ProductList.Rows.empty)
        } else {
            flights?.forEach({ departureItem in
                let product = FlightSearchTableCellUIData(flight: departureItem,
                                                          airlineList: response.flightDetailResponse?.airlines ?? [])
                cells.append(ProductList.Rows.product(product: product))
            })
        }
        
        let viewModel = ProductList.List.ViewModel(rows: cells)
        viewController?.displayList(viewModel: viewModel)
    }
}
