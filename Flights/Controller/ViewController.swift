//
//  ViewController.swift
//  Flights
//
//  Created by hackeru on 15/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import UIKit
import FSCalendar


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
                let endDate = calendarVM.dateRange?.last else {
                    return
                }
        
                guard let info = SelectionInformation(startDate: startDate, endDate: endDate, flyFrom: from, flyTo: to, numberOfPassngers: numOfPassngers) else { return }
        
                self.searchDelegate?.searchButtonTapped(info: info)
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

