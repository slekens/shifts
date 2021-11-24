//
//  Constants.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation

struct Constants {
    // MARK: - View Titles
    struct ViewTitles {
        static let MainTitle = "Coffee Co Shifts"
        static let CreateShift = "Create a Shift"
    }
    // MARK: - ViewControllers Bundle Names
    struct ViewControllers {
        static let MainController = "MainViewController"
        static let DetailViewController = "DetailViewController"
    }
    // MARK: - Cell Names
    struct CellNames {
        static let ShiftCell = "ShiftTableViewCell"
        static let FormCell = "FormTableViewCell"
    }
    // MARK: - Cell Identifiers
    struct CellIdentifier {
        static let MainIdentifier = "ShiftCellIdentifier"
        static let FormIdentifier = "FormCellIdentifier"
    }
    // MARK: - Dates Formatters.
    struct DateFormatter {
        static let mainDate = "yyyy-MM-dd HH:mm:ss Z"
        static let onlyDayMonth = "EEE, M/dd"
        static let onlyWorkHour = "h a"
        static let onlyHour = "h"
        static let formFormat = "EEE, MMM d, HH:mm a"
    }
}
