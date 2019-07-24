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
    
    var firstDate: Date?
    var lastDate: Date?
    var dateRange: [Date]?
    
    
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
                let startDate = dateRange?.first,
                let endDate = dateRange?.last
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
    

    
    private func rangeOfDates(from: Date, to: Date) -> [Date] {
        if from > to { return [] }
        
        var tempDate = from
        var arr = [tempDate]
        
        while tempDate < to {
            tempDate = Calendar.current.date(byAdding: .day, value: 1, to: tempDate)!
            arr.append(tempDate)
        }
        return arr
    }
    
    @IBAction func stpperAction(_ sender: UIStepper) {
        
        self.numberOfPassngersLabel.text = "\(Int(sender.value))"
        
    }
    
    @IBAction func showSuggestion(_ sender: UITextField) {
        let vc = AutoSegTableViewController.instantiate()
        vc.tableDelegate = self
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: Storyboarded, didSelectCountry{
    
    func setTextFields(_ country: String) {
        if (fromField.text?.count)! < 1 {
            fromField.text = country
        } else {
            toField.text = country
        }
    }
}


extension ViewController: FSCalendarDelegate, FSCalendarDataSource {
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
     // if notiong is selected
        if firstDate == nil {
            self.firstDate = date
            dateRange = [firstDate!]
            return
        }
        
        // only firstDate is selected
        if firstDate != nil && lastDate == nil {
            
            // if date is smaller then irstDate
            if date <= firstDate! {
                calendar.deselect(firstDate!)
                firstDate = date
                dateRange = [firstDate!]
                return
            }
            
            //if date is bigger
            let range = rangeOfDates(from: firstDate!, to: date)
            
            //last date
            self.lastDate = range.last
            
            for someDate in range {
                calendar.select(someDate)
            }
            
            dateRange = range
            return
            
        }
        
        // Both selected
        if firstDate != nil && lastDate != nil {
            for someDate in calendar.selectedDates {
                calendar.deselect(someDate)
            }
            firstDate = nil
            lastDate = nil
            dateRange = []
            
        }
        
        
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if firstDate != nil && lastDate != nil {
            for someDate in calendar.selectedDates {
                calendar.deselect(someDate)
            }
            firstDate = nil
            lastDate = nil
            dateRange = []
            
        }
    }
    
}

