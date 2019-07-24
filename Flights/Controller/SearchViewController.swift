//
//  SearchViewController.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit

protocol didSelectFlight: class{
    func showRouts(_ data: [Route]?)
}


class SearchViewController: UIViewController, Storyboarded {
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    @IBOutlet weak var collectionview: UICollectionView!
    var info: SelectionInformation?
    var arr: [FlightsSearchViewModel]?
    var data: [Datum]?
    
    weak var routeDelegate: didSelectFlight?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AppManager.shared.getFlights(info: info!) {[weak self] (res, err) in
            if let error = err {
                print("this is an error with the server call: \(error)")
            }
            
            guard let self = self, let res = res,
                let from = res.data?.first?.countryFrom,
                let to = res.data?.last?.countryTo else { return }
            
            self.arr = res.data?.compactMap{ FlightsSearchViewModel.init($0)}
            self.data = res.data
            
            self.navigationItem.title = from.name! + " -> " + to.name!
            self.indicator.stopAnimating()
            self.indicator.isHidden = !self.indicator.isHidden
            
            self.collectionview.delegate = self
            self.collectionview.dataSource = self
            self.collectionview.reloadData()
        }
        
        }
        
        // Do any additional setup after loading the view.
      
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
        self.routeDelegate?.showRouts(route)
    }
 
  
    
}
