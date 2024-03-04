//
//  ProductApiWorker.swift
//  AZCleanSwift
//
//  Created by Sefa Aycicek on 4.03.2024.
//

import UIKit

class ProductApiWorker {
    func getList(completion: @escaping ((FlightResponse?, NetworkError?))->Void) {
       let url = "https://65a7624794c2c5762da692dd.mockapi.io/api/v1/flights"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<FlightResponse, NetworkError>)  in
            switch result {
                case .success(let flightResponse) :
                    completion((flightResponse, nil))
                    break
                case .failure(let error) :
                    completion((nil, error))
                    break
            }
        }
    }
}
