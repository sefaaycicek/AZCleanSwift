//
//  ProductListRouter.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 5.03.2024.
//

import UIKit

protocol ProductRoutingLogic {
    func routeToDetail(flightResponse : FlightDataResponse, selectedIndex : Int)
    func routeToFlightOverview(flight : DepartureElement)
}
class ProductListRouter: NSObject, ProductRoutingLogic {

    weak var viewController : ProductListViewController?
    
    func routeToDetail(flightResponse: FlightDataResponse, selectedIndex: Int) {
        let detail = ViewControllerFactory.shared.makeProductDetail(flightDetailResponse: flightResponse, selectedIndex: selectedIndex)
        self.viewController?.navigationController?.pushViewController(detail, animated: true)
    }
    
    func routeToFlightOverview(flight: DepartureElement) {
        
    }
}
