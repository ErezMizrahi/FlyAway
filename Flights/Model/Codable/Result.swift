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
    let search_id: String?
    let data: [Datum]?
    let connections: [String?]?
    let time: Int?
    let currency: String?
    let currencyRate, fxRate: Int?
    let airlinesList: [AirlinesList]?
    let airportsList: [AirportsList]?
    let all_airlines: [String]?
    let all_prices: [String: Int]?
    let all_stopoverAirports: [String]?
    let best_results: [BestResult]?
    let hashtags: [Hashtag]?
    let location_hashtags: [String]?
}

// MARK: - AirlinesList
struct AirlinesList: Codable {
    let filter_name: String?
}

// MARK: - AirportsList
struct AirportsList: Codable {
    let filter_name: String?
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
    let nightsInDest: Int?
    let id: String?
    let countryFrom, countryTo: Country?
    let bags_price: [String: Double]?
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
    let pnrCount: Int?
    let has_airport_change, virtual_interlining: Bool?
    let fly_duration: String?
    let duration: Duration?
    let hashtags: [String]?
//    let facilitatedBookingAvailable: Bool?
    let bookingToken: String?
    let quality: Double?
}


// MARK: - Baglimit
struct Baglimit: Codable {
    let hold_width, hold_height, hold_length, hold_dimensions_sum: Int?
    let hold_weight, hand_hidth, hand_height, hand_length: Int?
    let hand_weight: Int?
}



// MARK: - Country
struct Country: Codable {
    let code: String?
    let name: String?
}


// MARK: - Duration
struct Duration: Codable {
    let departure, duration_return, total: Int?
}


// MARK: - Route
struct Route: Codable {
    let id, combination_iD: String?
    let route_return, original_return: Int?
    let source, found_on: String?
    let price, aTime, dTime, aTimeUTC: Int?
    let dTimeUTC: Int?
    let mapIdfrom, mapIdto: String?
    let cityTo, cityFrom: String?
    let flyTo: String?
    let airline, operating_carrier: String?
    let equipment: String?
    let flyFrom: String?
//    let latFrom, lngFrom, latTo, lngTo: Double?
    let flight_no: Int?
//    let refreshTimestamp: Int?
    let bags_recheck_required, guarantee: Bool?
    let fare_basis, fare_family: String?
//    let lastSeen: Int?
    let operating_flight_no: String?
//    let followingAirportChange: Bool?
}

// MARK: - Hashtag
struct Hashtag: Codable {
    let name: String?
    let count: Int?
}


