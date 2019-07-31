//
//  RoutsViewModel.swift
//  Flights
//
//  Created by hackeru on 24/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation

struct RoutsViewModel{
    let cityFrom: String
    let cityTo: String
    let aTime: String
    let dTIme: String
    
}

extension RoutsViewModel{
    init?(data: Route){
        
        guard let from = data.cityFrom,
            let to = data.cityTo,
            let atime =  data.dTimeUTC ,
            let dtime =  data.aTimeUTC
        else {
                return nil
        }
        
        cityFrom = from
        cityTo = to
        aTime = atime.dateFormatter()
        dTIme = dtime.dateFormatter()
    }
}
