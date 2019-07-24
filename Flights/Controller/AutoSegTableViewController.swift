//
//  AutoSegTableViewController.swift
//  Flights
//
//  Created by hackeru on 24/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

protocol didSelectCountry: class {
    func setTextFields(_ country: String)
}

class AutoSegTableViewController: UIViewController, Storyboarded {
    var arr = [CountryData]()
    var tableDelegate: didSelectCountry?
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arr = CountryData.all
        // Do any additional setup after loading the view.
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
    }
}


extension AutoSegTableViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "autoCell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableDelegate?.setTextFields( arr[indexPath.row].name )
        self.dismiss(animated: true, completion: nil)
    }
    
}
