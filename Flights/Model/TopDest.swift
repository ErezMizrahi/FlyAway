//
//  TopDest.swift
//  Flights
//
//  Created by hackeru on 28/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
struct Dest{
    let name: String
    let image: String
    let code: String
    
    static var topDest: [Dest] = [
        Dest(name: "Rome", image: "rome", code: "FCO"),
        Dest(name: "New York", image: "newyork", code: "JFK"),
        Dest(name: "Bangkok", image: "thiland", code: "BKK"),
        Dest(name: "Paris", image: "paris", code: "CDG"),
        Dest(name: "Changi", image: "china", code: "SIN")
    ]
}
