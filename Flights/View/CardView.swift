//
//  CardView.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class CardView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 25
        self.layer.masksToBounds = true
    }
    
    
}
