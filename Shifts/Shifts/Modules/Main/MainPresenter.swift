//
//  MainPresenter.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import Foundation

class MainPresenter {
    
    // MARK: - Properties
    weak var view: MainView?
    var dataSource: DataSource?
    
    // MARK: - Initialization
    init(with view: MainView) {
        self.view = view
        self.dataSource = DataSource()
        self.dataSource?.delegate = self
    }
    
    // MARK: - Getting information
    func fetchData() {
        dataSource?.fetchData()
    }
}

// MARK: - Data Source Delegate
extension MainPresenter: DataSourceProtocol {
    
    func didFetchResults(results: [Shift]) {
        view?.setShifts(list: results)
    }
}
