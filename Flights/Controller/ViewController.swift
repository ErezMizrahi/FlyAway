//
//  ViewController.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit
import FSCalendar

protocol ISearchLogic: class {
    func searchButtonTapped(from: String,
                            to: String,
                            numOfPassngers: String,
                            startDate: String,
                            endDate: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var toField: UITextField!
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var numberOfPassngersLabel: UILabel!
    
    weak var searchDelegate: ISearchLogic?
    var isFirstTextField: Bool = true
    
    var calendarVM = ClanedarViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.calendar.delegate = self
        self.calendar.dataSource = self
        self.calendar.allowsMultipleSelection = true
        self.numberOfPassngersLabel.text = "\(1)"
     
        
    }
    
    

    
    @IBAction func tap(_ sender: Any) {
        
        guard let from = fromField.text,
                let to = toField.text,
                let numOfPassngers = numberOfPassngersLabel.text,
                let startDate = calendarVM.dateRange?.first,
                let endDate = calendarVM.dateRange?.last
        else {
                return
        }
        
        //
        let toPlace = CountryData.all.filter{$0.name == to}.first
        let fromPlace = CountryData.all.filter{$0.name == from}.first

        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let sDate = formatter.string(from: startDate)
        let eDate = formatter.string(from: endDate)
        
        self.searchDelegate?.searchButtonTapped(from: (fromPlace?.code)!, to: (toPlace?.code)!, numOfPassngers: numOfPassngers, startDate: sDate, endDate: eDate)

    }
    

    @IBAction func stpperAction(_ sender: UIStepper) {
        
        self.numberOfPassngersLabel.text = "\(Int(sender.value))"
        
    }
    
    @IBAction func showSuggestion(_ sender: UITextField) {
       isFirstTextField = sender.tag == 0 ? true : false
        let vc = AutoSegTableViewController.instantiate()
        vc.tableDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: Storyboarded, didSelectCountry{
    
    func setTextFields(_ country: String) {
        if (isFirstTextField){
            fromField.text = country
        } else {
            toField.text = country
        }
    }
}


extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendarVM.chooseDate(date: date, calendar)

        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendarVM.deSelectDate(calendar)

    }
    
}

