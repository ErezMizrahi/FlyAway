//
//  SearchViewController.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, Storyboarded {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionview: UICollectionView!
    var info: SelectionInformation?
    var arr: [FlightsSearchViewModel]?
    var data: [Datum]?
    
    weak var routeDelegate: didSelectFlight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Flights"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(changeDirection))
        
        collectionview.delegate = self
        collectionview.dataSource = self
        apiCall(info: info)
     
        }
    
    @objc func changeDirection() {
        guard let info = self.info else { return }
        let reversedInfo = SelectionInformation(startDate: info.startDate, endDate: info.endDate, flyFrom: info.flyTo, flyTo: info.flyFrom, numberOfPassngers: "1")
        
            self.indicator.isHidden = false
            self.apiCall(info: reversedInfo)
        
//        apiCall(info: reversedInfo)
    }
    
    private func apiCall(info : SelectionInformation?) {
        AppManager.shared.getFlights(info: info!) {[weak self] (res, err) in
            if let error = err {
                
                print("this is an error with the server call: \(error)")
            }
            guard let self = self, let res = res else { return }
            self.convertResultToVM(result: res)
            self.updateIndicator()
            self.updateCollection()
        }
    }
    
    func convertResultToVM(result res: Result){
        arr = res.data?.compactMap{ FlightsSearchViewModel.init($0)}
        if arr == nil {
            self.alert(message: "we cant find flights", title: "OPS!")
            }
        data = res.data
    }
    
    func updateCollection(){
        collectionview.reloadData()
    }
    
    func updateIndicator(){
        indicator.isAnimating ? indicator.stopAnimating() : indicator.startAnimating()
        indicator.isHidden = !indicator.isHidden
    }
    }
    


extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FlightsDetailCell
        
        guard let cellInfo = arr?[indexPath.row] else { return UICollectionViewCell()}
        cell.populateCell(with: cellInfo)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let route = data?[indexPath.row].route
        guard let d = data?[indexPath.row] else { return }
        self.routeDelegate?.showRouts(route,data: d)
    }
 
    
  
    
}

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
