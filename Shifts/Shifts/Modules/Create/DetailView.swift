//
//  DetailView.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import Foundation

// MARK: - Detail View
protocol DetailView: AnyObject {
    func initialData(form: [FormModel])
    func saveSuccess()
    func saveError()
}
