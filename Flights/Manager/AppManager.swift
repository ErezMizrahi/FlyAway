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
    
    
    //dummy test
    func getFlights() {
        networkService.request(.flights(from: "LA", to: "TLV", start: "16/07/2019", end: "23/07/2019")) { (result) in
            switch result {
            case .success(let response):
                NetworkCalls.shared.TryDecode(data: response.data, callback: { (res, err) in
                    if let err = err {
                        print(err)
                    } else {
                        print(res?.data?[0].distance)
                    }
                    
                })
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
