//
//  AppManager.swift
//  Flights
//
//  Created by hackeru on 16/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
import Moya

class AppManager {
    static let shared = AppManager()
    let networkService = MoyaProvider<Network.Flightsprovider>()
    
    
    typealias callback = (Result?, Error?) -> ()
    func getFlights(info: SelectionInformation, callback: @escaping callback) {
        networkService.request(.flights(from: info.flyFrom, to: info.flyTo, start: info.startDate, end: info.endDate, adults: info.numberOfPassngers)) { (result) in
            switch result {
            case .success(let response):
                NetworkCalls.shared.TryDecode(data: response.data, callback: { (res, err) in
                    if let err = err {
                        callback(nil,err)
                    } else {
                        callback(res, nil)
                    }
                })
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
