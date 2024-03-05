//
//  ProductListModels.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

enum ProductList {
    // getlsit ile api den data çek
    // delete ile bi satırı sil
    
    enum List {
        struct Request {
            let pageIndex : Int
            let pageItemCount : Int
        }
        struct Response {
            let flightDetailResponse : FlightDataResponse?
//            let dbResponse : NSObject
        }
        struct ViewModel {
            let rows : [Rows]
        }
    }
    
    enum Rows {
        case empty
        case product(product : FlightSearchTableCellUIData)
        
        func identifier() -> String {
            switch self {
            case .empty:
                return "empty_cell_identifier"
            case .product:
                return "FlightCellTableViewCell"
            }
        }
    }
    
    enum ProductDelete {
        struct Request {
            
        }
        struct Response {
            
        }
        struct ViewModel {
            
        }
    }
}
