//
//  ProductListInteractor.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

protocol ProductListBusinessLogic {
    func getList(request : ProductList.List.Request)
}

protocol ProductListDataStore {
    var flightResponse : FlightResponse? { get set }
}

class ProductListInteractor: ProductListBusinessLogic, ProductListDataStore {
    var flightResponse: FlightResponse? = nil
    var presenter : ProductListPresentationLogic?
    var worker : ProductApiWorker?
    
    func getList(request : ProductList.List.Request) {
        worker = ProductApiWorker()
        worker?.getList(completion: { (response, error) in
            self.flightResponse = response
            
            let presentationResponse = ProductList.List.Response(flightDetailResponse: response?.data)
            self.presenter?.present(response: presentationResponse)
        })
    }
}
