//
//  FlowManager.swift
//  Flights
//
//  Created by hackeru on 20/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
import UIKit

class FlowManager {
 
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
//        let vc = ViewController.instantiate()
        let vc = MainViewController.instantiate()
//        vc.searchDelegate = self
        vc.callback = {
            self.goScreen()
        }
        self.navigationController.pushViewController(vc, animated: true)
    }
    
    private func goScreen ()  {
        let vc = ViewController.instantiate()
        vc.searchDelegate = self
        self.navigationController.pushViewController(vc, animated: true)
    }
}

extension FlowManager: ISearchLogic {
    func searchButtonTapped(from: String, to: String, numOfPassngers: String, startDate: String, endDate: String) {
        
        let sVC = SearchViewController.instantiate()
        sVC.info = SelectionInformation(startDate: startDate, endDate: endDate, flyFrom: from, flyTo: to, numberOfPassngers: numOfPassngers)
        
        self.navigationController.pushViewController(sVC, animated: true)
    }
}
