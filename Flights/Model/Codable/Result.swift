//
//  Result.swift
//  Flights
//
//  Created by hackeru on 16/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation


// MARK: - Welcome
struct Result: Codable {
    let searchID: String?
    let data: [Datum]?
    let connections: [String?]?
    let time: Int?
    let currency: String?
    let currencyRate, fxRate: Int?
    let del: Int?
    let airlinesList: [AirlinesList]?
    let airportsList: [AirportsList]?
    let allAirlines: [String]?
    let allPrices: [String: Int]?
    let allStopoverAirports: [String]?
    let bestResults: [BestResult]?
    let hashtags: [Hashtag]?
    let locationHashtags: [String]?
}

// MARK: - AirlinesList
struct AirlinesList: Codable {
    let filterName: String?
}

// MARK: - AirportsList
struct AirportsList: Codable {
    let filterName: String?
    let name: String?
}



// MARK: - BestResult
struct BestResult: Codable {
    let sort: String?
    let price, duration: Int?
    let quality: Double?
}

// MARK: - Datum
struct Datum: Codable{

    let id: String?
    let countryFrom, countryTo: Country?
    let bagsPrice: [String: Double]?
    let baglimit: Baglimit?
    let dTime, aTime, dTimeUTC, p1: Int?
    let p2, p3, aTimeUTC, price: Int?
    let flyFrom: String?
    let mapIdfrom, mapIdto: String?
    let flyTo: String?
    let distance: Double?
    let cityFrom, cityTo: String?
    let route: [Route]?
    let routes: [[String]]?
    let airlines: [String]?
//    let nightsInDest: NSNull?
    let pnrCount: Int?
    let hasAirportChange, virtualInterlining: Bool?
    let flyDuration: String?
    let duration: Duration?
    let hashtags: [String]?
    let facilitatedBookingAvailable: Bool?
//    let conversion: String?
    let bookingToken: String?
    let quality: Double?
}


// MARK: - Baglimit
struct Baglimit: Codable {
    let holdWidth, holdHeight, holdLength, holdDimensionsSum: Int?
    let holdWeight, handWidth, handHeight, handLength: Int?
    let handWeight: Int?
}



// MARK: - Country
struct Country: Codable {
    let code: String?
    let name: String?
}


// MARK: - Duration
struct Duration: Codable {
    let departure, durationReturn, total: Int?
}


// MARK: - Route
struct Route: Codable {
    let id, combinationID: String?
    let routeReturn, originalReturn: Int?
    let source, foundOn: String?
    let price, aTime, dTime, aTimeUTC: Int?
    let dTimeUTC: Int?
    let mapIdfrom, mapIdto: String?
    let cityTo, cityFrom: String?
    let flyTo: String?
    let airline, operatingCarrier: String?
    let equipment: String?
    let flyFrom: String?
    let latFrom, lngFrom, latTo, lngTo: Double?
    let flightNo: Int?
    let refreshTimestamp: Int?
    let bagsRecheckRequired, guarantee: Bool?
    let fareBasis, fareFamily: String?
    let lastSeen: Int?
    let operatingFlightNo: String?
    let followingAirportChange: Bool?
}

// MARK: - Hashtag
struct Hashtag: Codable {
    let name: String?
    let count: Int?
}


