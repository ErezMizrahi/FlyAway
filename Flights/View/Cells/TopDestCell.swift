//
//  TopDestCell.swift
//  Flights
//
//  Created by hackeru on 28/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class TopDestCell: UITableViewCell {
    
    override func awakeFromNib() {
        self.selectionStyle = .none
    }
    
    @IBOutlet weak var destImg: UIImageView! {
        didSet {
            destImg.layer.cornerRadius = 25
            destImg.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var destLabel: UILabel!
    

}
