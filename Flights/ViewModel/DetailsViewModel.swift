//
//  DetailsViewModel.swift
//  Flights
//
//  Created by hackeru on 04/08/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation


struct DetailsVM {
    let flightBagPrice: String
    let flightPrice: String
    let flightDuration: String
    let bagHeight, bagWidth, bagLength, bagWeight: String
    let nights: String
//    let flightNum: String
}

extension DetailsVM {
    init(data: Datum) {
        self.flightPrice = "Price: " + (data.price?.currencyFormatter() ?? "")
        self.flightDuration = "Flight Duration: " + (data.fly_duration?.description ?? "")
        self.bagWidth = "Bag Width Limit: " + (data.baglimit?.hold_width?.description ?? "")
        self.bagHeight = "Bag Height Limit:" + (data.baglimit?.hold_height?.description ?? "")
        self.bagWeight = "Bag Weight Limit: " + (data.baglimit?.hold_weight?.description ?? "")
        self.bagLength = "Bag Length Limit: " + (data.baglimit?.hold_length?.description ?? "")
        self.flightBagPrice = "Bags Price: " + (data.bags_price?["1"]?.description ?? "")
        self.nights = "Nights In Dest: " + (data.nightsInDest?.description ?? "")
//        self.flightNum = "Flight Number " + (data.route?[0].flight_no?.description ?? "")
    }
}
