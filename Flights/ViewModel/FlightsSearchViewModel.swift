//
//  FlightsSearchViewModel.swift
//  Flights
//
//  Created by hackeru on 19/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation

struct FlightsSearchViewModel {
    let fromString: String
    let toString: String
    let price: String
    let departure: String
    let arrival: String
    
     static func currencyFormatter(price: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: price)) ?? ""
    }
    
    static func timeFormmater(time: Int) -> String {
        let timeFormmater = DateFormatter()
        let timeStemp = Date(timeIntervalSince1970: TimeInterval(time))
        
        timeFormmater.dateStyle = .medium
        timeFormmater.timeStyle = .medium
        timeFormmater.timeZone = .current
        
        return timeFormmater.string(from: timeStemp)
        
    }
    
}

extension FlightsSearchViewModel {
    init?(_ data: Datum) {
        guard let from = data.cityFrom,
            let to = data.cityTo,
            let price = data.price,
            let aTime = data.aTime,
            let dTime = data.dTime
        else {
            return nil
        }
        self.fromString = from
        self.toString = to
        self.price = FlightsSearchViewModel.currencyFormatter(price: price)
        self.arrival = FlightsSearchViewModel.timeFormmater(time: aTime)
        self.departure = FlightsSearchViewModel.timeFormmater(time: dTime)
    }
}
