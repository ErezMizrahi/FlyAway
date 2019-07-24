//
//  RoutsViewController.swift
//  Flights
//
//  Created by hackeru on 24/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class RoutsViewController: UIViewController, Storyboarded {
    
    enum SectionHeaders: String, CaseIterable {
        case routs
    }

    @IBOutlet weak var tableview: UITableView!
    var routs = [RoutsViewModel]()
    let catgories = SectionHeaders.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.reloadData()
    }

}

extension RoutsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return routs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRouts", for: indexPath) as! RoutCell
        
        let vm = routs[indexPath.row]
        cell.populate(vm)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return catgories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return catgories[section].rawValue
    }
    
    
    
    
}
