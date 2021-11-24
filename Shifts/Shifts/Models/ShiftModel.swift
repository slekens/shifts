//
//  ShiftModel.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation
import UIKit

// MARK: - Shift List Model
struct ShiftList: Codable {
    var shifts: [Shift]
}

// MARK: - Shift Base Model
struct Shift: Codable {
    var role: String
    var name: String
    var startDate: String
    var endDate: String
    var color: String
    
    enum CodingKeys: String, CodingKey {
        case role
        case name
        case startDate = "start_date"
        case endDate = "end_date"
        case color
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        role = try container.decode(String.self, forKey: .role)
        name = try container.decode(String.self, forKey: .name)
        startDate = try container.decode(String.self, forKey: .startDate)
        endDate = try container.decode(String.self, forKey: .endDate)
        color = try container.decode(String.self, forKey: .color)
    }
    
    init(role: String, name: String, startDate: String, endDate: String, color: String) {
        self.role = role
        self.name = name
        self.startDate = startDate
        self.endDate = endDate
        self.color = color
    }
    
    /// Get the correct color for every value.
    func getViewColor() -> UIColor {
        switch color {
        case "red":
            return .systemRed
        case "blue":
            return .systemBlue
        case "green":
            return .systemMint
        default:
            return .gray
        }
    }
}
