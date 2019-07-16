//
//  Network.swift
//  Flights
//
//  Created by hackeru on 16/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
import Moya

class NetworkCalls {
    
    static let shared = NetworkCalls()
    private init() {}
    
    typealias callback = (_: Result?, _ err: Error?)->Void
    
    func TryDecode (data: Data?, callback: callback)  {
        guard let data = data else { return }
        print(data)
        do{
            let t = try JSONDecoder().decode(Result.self, from: data)
            callback(t,nil)
        }
        catch {
            callback(nil,error)
        }
    }
}

enum Network{
    enum Flightsprovider: TargetType {
        case flights(from: String, to: String, start: String, end: String)
        
        var baseURL: URL{
            return URL(string: "https://api.skypicker.com")!
        }
        
        var path: String{
            switch self {
            case .flights:
                return "flights"
            }
        }
        
        var method: Moya.Method{
            return .get
        }
        
        var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            switch self {
            case let .flights(from, to, start, end):
                return .requestParameters(parameters: ["flyFrom": from,
                                                       "to": to,
                                                       "dateFrom": start,
                                                       "dateTo": end],
                                          encoding: URLEncoding.queryString)
            }
        }
        
        var headers: [String : String]? {
            return [:]
        }
        
        
    }
}


