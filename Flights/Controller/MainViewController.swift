//
//  MainViewController.swift
//  Flights
//
//  Created by hackeru on 21/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, Storyboarded {
    
    var callback: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Welcome"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        // Do any additional setup after loading the view.
    }
    


    @IBAction func searchAction(_ sender: UIButton) {
        callback?()
    }
    
}
