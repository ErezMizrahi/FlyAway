//
//  SelectionInformation.swift
//  Flights
//
//  Created by hackeru on 20/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation

struct SelectionInformation {
    var startDate: String
    var endDate: String
    var flyFrom: String
    var flyTo: String
    var numberOfPassngers: String
    
    static func formate(date: Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.string(from: date)
    }
}

extension SelectionInformation{
    init?(startDate: Date, endDate: Date,
         flyFrom: String, flyTo: String,
         numberOfPassngers: String) {
        ////
        let toPlace = CountryData.all.filter{$0.name == flyTo}.first
        let fromPlace = CountryData.all.filter{$0.name == flyFrom}.first
        ////
        
        self.flyTo = toPlace?.code ?? ""
        self.flyFrom = fromPlace?.code ?? ""
        self.numberOfPassngers = numberOfPassngers
        self.startDate = SelectionInformation.formate(date: startDate)
        self.endDate = SelectionInformation.formate(date: endDate)
        
    }
}
