//
//  DataSource.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation

// MARK: - DataSource Protocol
protocol DataSourceProtocol: AnyObject {
    func didFetchResults(results: [Shift])
}

class DataSource {
        
    // MARK: - Properties
    private let fileName = "shifts"
    var delegate: DataSourceProtocol?
    var results: [Shift] = []
    
    // MARK: - Data fetching
    func fetchData() {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else { return }
        do {
            let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonResults = try JSONDecoder().decode(ShiftList.self, from: jsonData)
            results = jsonResults.shifts.sorted(by: { $0.startDate > $1.startDate })
            delegate?.didFetchResults(results: results)
        } catch {
            delegate?.didFetchResults(results: [])
        }
    }
    
    func initialFormData() -> [FormModel] {
        return [FormModel(title: "Start Date*", data: "Select a Date", typeForm: .date, iconName: .date),
                FormModel(title: "End Date*", data: "Select a Date", typeForm: .date, iconName: .date),
                FormModel(title: "Employee*", data: "Select an Employee", typeForm: .employee, iconName: .employee),
                FormModel(title: "Role*", data: "Select a Role", typeForm: .role, iconName: .role),
                FormModel(title: "Color*", data: "Select a Color", typeForm: .color, iconName: .color)]
    }
    
    func addingNewElement(element: [FormModel]) {
        let startDate = Formatters.convertToOriginalDate(date: element[0].data)
        let endDate = Formatters.convertToOriginalDate(date: element[1].data)
        let shift = Shift(role: element[3].data,
                          name: element[2].data,
                          startDate: startDate,
                          endDate: endDate,
                          color: element[4].data.lowercased())
        print(shift.startDate)
        results.insert(shift, at: 0)
        delegate?.didFetchResults(results: results)
    }
}
