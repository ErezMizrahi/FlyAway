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
    let int: Int = 0
  
}

extension FlightsSearchViewModel {
    init?(_ data: Datum) {
        guard let from = data.cityFrom,
            let to = data.cityTo,
            let price = data.price,
            let aTime = data.route?.last?.aTimeUTC,
            let dTime = data.dTimeUTC
        else {
            return nil
        }
        self.fromString = from
        self.toString = to
        self.price = price.currencyFormatter()
        self.arrival = aTime.dateFormatter()
        self.departure = dTime.dateFormatter()
    }
}


extension Int {
     func currencyFormatter() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
    
     func dateFormatter() -> String {
        let dateFormatter = DateFormatter()
        let timeStemp = Date(timeIntervalSince1970: TimeInterval(self))
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.timeZone = .current
        
        return dateFormatter.string(from: timeStemp)
        
    }
     func timeFormmater() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .full

        return formatter.string(from: TimeInterval(self))!
    }
}
