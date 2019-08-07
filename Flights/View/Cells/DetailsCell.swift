//
//  DetailsCell.swift
//  Flights
//
//  Created by hackeru on 04/08/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class DetailsCell: UITableViewCell {

    @IBOutlet weak var flightDurationLabel: UILabel!
    @IBOutlet weak var nightsInDestLabel: UILabel!
    @IBOutlet weak var bagWeight: UILabel!
    @IBOutlet weak var bagLength: UILabel!
    @IBOutlet weak var bagWidth: UILabel!
    @IBOutlet weak var bagHeight: UILabel!
    @IBOutlet weak var bagCostLabel: UILabel!
    @IBOutlet weak var flightPriceLabel: UILabel!
    
    var buttonTap: (() ->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    
    func populate(vm: DetailsVM) {
        self.flightPriceLabel.text = vm.flightPrice
        self.nightsInDestLabel.text = vm.nights
        self.flightDurationLabel.text = vm.flightDuration
        self.bagWidth.text = vm.bagWidth
        self.bagHeight.text = vm.bagHeight
        self.bagLength.text = vm.bagLength
        self.bagWeight.text = vm.bagWeight
        self.bagCostLabel.text = vm.flightBagPrice
//        self.fromCityLabel.text = vm.flightNum
    }

    @IBAction func goToWebAction(_ sender: UIButton) {
        buttonTap?()
    }
    
}
