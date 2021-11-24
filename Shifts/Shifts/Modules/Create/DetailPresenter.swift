//
//  DetailPresenter.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import Foundation

struct DetailPresenter {
    
    // MARK: - Properties
    
    private var view: DetailView?
    private var dataSource: DataSource?
    
    // MARK: - Initialization
    
    init(with view: DetailView, dataSource: DataSource) {
        self.view = view
        self.dataSource = dataSource
    }
    
    // MARK: - Get data
    
    func getInitialFormState() {
        let dataSource = DataSource()
        let initialForm = dataSource.initialFormData()
        view?.initialData(form: initialForm)
    }
    
    func saveShift(model: [FormModel]) {
        for form in model {
            if form.data.hasPrefix("Select") {
                view?.saveError()
                return
            }
        }
        dataSource?.addingNewElement(element: model)
        view?.saveSuccess()
    }
}
