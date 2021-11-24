//
//  Formatters.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation

// MARK: - Date Formatters
struct Formatters {
    
    static func convertToOriginalDate(date: String) -> String {
        let dateFormatterDefault = DateFormatter()
        dateFormatterDefault.dateFormat = Constants.DateFormatter.formFormat
        
        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = Constants.DateFormatter.mainDate
        
        if let dateFinal = dateFormatterDefault.date(from: date) {
            return dateFormatterFinal.string(from: dateFinal)
        } else {
            return ""
        }
    }
    
    static func shortDate(date: String) -> String {
        
        let dateFormatterDefault = DateFormatter()
        dateFormatterDefault.dateFormat = Constants.DateFormatter.mainDate
        
        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = Constants.DateFormatter.onlyDayMonth
        
        if let dateFinal = dateFormatterDefault.date(from: date) {
            return dateFormatterFinal.string(from: dateFinal)
        } else {
            return ""
        }
    }
    
    static func workSchedule(startDate: String, endDate: String) -> String {
        let dateFormatterDefault = DateFormatter()
        dateFormatterDefault.dateFormat = Constants.DateFormatter.mainDate
        
        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = Constants.DateFormatter.onlyWorkHour
        
        if let end = dateFormatterDefault.date(from: endDate) {
            let start = Formatters.getStartDate(date: startDate)
            return start + "-" + dateFormatterFinal.string(from: end)
        } else {
            return ""
        }
    }
    
    static func formDate(date: Date) -> String {
        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = Constants.DateFormatter.formFormat
        return dateFormatterFinal.string(from: date)
    }
    
    private static func getStartDate(date: String) -> String {
        let dateFormatterDefault = DateFormatter()
        dateFormatterDefault.dateFormat = Constants.DateFormatter.mainDate
        
        let dateFormatterFinal = DateFormatter()
        dateFormatterFinal.dateFormat = Constants.DateFormatter.onlyHour
        
        if let start = dateFormatterDefault.date(from: date) {
            return dateFormatterFinal.string(from: start)
        } else {
            return ""
        }
    }
}
