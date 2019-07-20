//
//  FlowManager.swift
//  Flights
//
//  Created by hackeru on 20/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
import UIKit

class FlowManager: ISearchLogic {
 
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.searchDelegate = self
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    func searchButtonTapped(from: String, to: String, numOfPassngers: String, startDate: String, endDate: String) {
        let sVC = SearchViewController.instantiate()
      
        sVC.info = SelectionInformation(startDate: startDate, endDate: endDate, flyFrom: from, flyTo: to, numberOfPassngers: numOfPassngers)
        
        self.navigationController.pushViewController(sVC, animated: true)
    }
    
}
