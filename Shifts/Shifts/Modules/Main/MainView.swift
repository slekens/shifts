//
//  MainView.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation

// MARK: - View Protocol

protocol MainView: AnyObject {
    func setShifts(list: [Shift])
}
