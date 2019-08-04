//
//  MainViewController.swift
//  Flights
//
//  Created by hackeru on 21/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit


class MainViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableview: UITableView!
    var callback: (() -> Void)?
    weak var searchDelegate: ISearchLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.reloadData()
    }
    
    private func setupNavBar() {
        navigationItem.hidesBackButton = true
    }

    @IBAction func searchAction(_ sender: UIButton) {
        callback?()
    }

}


extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dest.topDest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topDestCell", for: indexPath) as! TopDestCell
        let dest = Dest.topDest[indexPath.row]
        cell.destImg.image = UIImage(named: dest.image)
        cell.destLabel.text = dest.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //by defalt its from israel.. could get user location and determine the flight accurdingly
        tableView.deselectRow(at: indexPath, animated: true)
        let todayDate = Date()
        let oneWeek = Calendar.current.date(byAdding: .day, value: 7, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        
        let info = SelectionInformation(startDate: formatter.string(from: todayDate), endDate: formatter.string(from: oneWeek ?? Date()), flyFrom: "IL", flyTo: Dest.topDest[indexPath.row].code, numberOfPassngers: "1")
        
        searchDelegate?.searchButtonTapped(info: info)
    }
    
}
