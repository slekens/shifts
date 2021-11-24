//
//  PickersDataSource.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import Foundation

struct PickersDataSource {
    
    // MARK: - All the mock DataSources
    static func getEmployeeData() -> [String] {
        return ["Anna", "Anton", "Eugene", "Keyvan"]
    }
    
    static func getRoleData() -> [String] {
        return ["Waitress", "Prep", "Cook", "Front of House"]
    }
    
    static func getColorData() -> [String] {
        return ["Red", "Green", "Blue"]
    }
}
