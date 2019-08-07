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
        case Routes
        case Deatils
    }

    @IBOutlet weak var tableview: UITableView!
    var routs = [RoutsViewModel]()
    var infoVM: Datum?
    let catgories = SectionHeaders.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.largeTitleDisplayMode = .never

        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.reloadData()
    }

}

extension RoutsViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
        return routs.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellRouts", for: indexPath) as! RoutCell
            let vm = routs[indexPath.row]
            cell.populate(vm)
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellInfo", for: indexPath) as! DetailsCell
            let vm = DetailsVM(data: infoVM!)
            cell.populate(vm: vm)
            cell.buttonTap = {
                guard let url = URL(string: vm.bookingUrl) else { return }
                UIApplication.shared.open(url)
            }
            return cell
        }

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return catgories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return catgories[section].rawValue
    }
    
    
    
    
}
