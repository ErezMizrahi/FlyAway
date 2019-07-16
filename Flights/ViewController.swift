//
//  ViewController.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tap: UITapGestureRecognizer!
    @IBOutlet weak var cardView: CardView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AppManager.shared.getFlights()
     
        
    }

    @IBAction func tap(_ sender: Any) {
        performSegue(withIdentifier: "toSearch", sender: nil)
    }
    
}

