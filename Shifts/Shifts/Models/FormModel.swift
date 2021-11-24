//
//  FormModel.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import Foundation

// MARK: - Form Model
struct FormModel {
    var title: String
    var data: String
    var typeForm: TypeForm
    var iconName: TypeIconForm
}

// MARK: - Aux Models
enum TypeIconForm: String {
    case date = "calendar"
    case employee = "person.fill"
    case role = "person.crop.square.filled.and.at.rectangle.fill"
    case color = "paintpalette.fill"
}

enum TypeForm {
    case date
    case employee
    case role
    case color
}
