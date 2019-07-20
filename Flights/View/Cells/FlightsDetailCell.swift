//
//  FlightsDetailCell.swift
//  Flights
//
//  Created by hackeru on 18/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class FlightsDetailCell: UICollectionViewCell {
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var arrivalLabel: UILabel!
    @IBOutlet weak var departureLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    func populateCell(with info: FlightsSearchViewModel) {
        fromLabel.text = info.fromString
        toLabel.text = info.toString
        priceLabel.text = info.price
        arrivalLabel.text = info.arrival
        departureLabel.text = info.departure
    }
    
}
