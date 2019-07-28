//
//  RoutCell.swift
//  Flights
//
//  Created by hackeru on 24/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class RoutCell: UITableViewCell {
    @IBOutlet weak var fromCity: UILabel!
    @IBOutlet weak var routFrom: UILabel!
    @IBOutlet weak var toCity: UILabel!
    @IBOutlet weak var routTo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

     func populate(_ vm: RoutsViewModel){
        self.fromCity.text = vm.cityFrom
        self.toCity.text = vm.cityTo
        self.routFrom.text = vm.aTime
        self.routTo.text = vm.dTIme
    }

}
