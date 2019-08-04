//
//  Protocols.swift
//  Flights
//
//  Created by hackeru on 04/08/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation

protocol ISearchLogic: class {
    func searchButtonTapped(info : SelectionInformation)
}

protocol didSelectFlight: class{
    func showRouts(_ route: [Route]?, data: Datum)
}

protocol didSelectCountry: class {
    func setTextFields(_ country: String)
}

