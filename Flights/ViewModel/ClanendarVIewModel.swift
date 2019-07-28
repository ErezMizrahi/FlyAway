//
//  ClanendarVIewModel.swift
//  Flights
//
//  Created by hackeru on 28/07/2019.
//  Copyright © 2019 erez8. All rights reserved.
//

import Foundation
import FSCalendar

struct ClanedarViewModel{
    var firstDate: Date?
    var lastDate: Date?
    var dateRange: [Date]?
    
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
    
    mutating func chooseDate (date: Date, _ calendar: FSCalendar) {
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
    
    mutating func deSelectDate(_ calendar: FSCalendar) {
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
