//
//  DetailViewController.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet fileprivate weak var tableView: UITableView!
    private var saveButton: UIBarButtonItem?
    private var formData: [FormModel] = []
    private var presenter: DetailPresenter?
    private var currentIndex: Int = 0
    
    var dataSource: DataSource?

    // MARK: - Initialization
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.backItem?.title = "Shifts"
    }
}

// MARK: - Private
private extension DetailViewController {
    
    func setup() {
        self.title = Constants.ViewTitles.CreateShift
        setupSaveButton()
        setupTableView()
        presenter = DetailPresenter(with: self, dataSource: dataSource ?? DataSource())
        presenter?.getInitialFormState()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.CellNames.FormCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifier.FormIdentifier)
    }
    
    func setupSaveButton() {
        saveButton = UIBarButtonItem(image: UIImage(systemName: "doc.fill.badge.plus"), style: .plain, target: self, action: #selector(saveShift))
        saveButton?.isEnabled = false
        self.navigationItem.rightBarButtonItem = saveButton
    }
    
    func setData(type: TypeForm) {
        var dataPicker: DataPicker?
        switch type {
        case .date:
            let form = DatePicker(with: .date)
            form.delegate = self
            self.navigationController?.view.addSubview(form)
        case .employee:
            dataPicker = DataPicker(with: .employee)
        case .role:
            dataPicker = DataPicker(with: .role)
        case .color:
            dataPicker = DataPicker(with: .color)
        }
        if let picker = dataPicker {
            picker.delegate = self
            self.navigationController?.view.addSubview(picker)
        }
    }
}

// MARK: - Objc Functions

@objc extension DetailViewController {
    
    func saveShift() {
        presenter?.saveShift(model: formData)
    }
}

// MARK: - Form DataSource
extension DetailViewController: DetailView {
    func initialData(form: [FormModel]) {
        formData = form
        tableView.reloadData()
    }
    
    func saveSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveError() {
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        let alert = UIAlertController(title: "Warning", message: "Please fill in all required fields.", preferredStyle: .alert)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table View Delegate
extension DetailViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let form = formData[indexPath.row]
        currentIndex = indexPath.row
        setData(type: form.typeForm)
    }
}

// MARK: - TableView DataSource
extension DetailViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.FormIdentifier, for: indexPath) as? FormTableViewCell else { return UITableViewCell() }
        let form = formData[indexPath.row]
        cell.configure(model: form)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formData.count
    }
}

// MARK: - Date Picker Delegate
extension DetailViewController: DatePickerDelegate {
    func didSelectDate(date: String) {
        formData[currentIndex].data = date
        saveButton?.isEnabled = true
        tableView.reloadData()
    }
}

// MARK: - Data Picker Delegate
extension DetailViewController: DataPickerDelegate {
    func didSelectItem(item: String) {
        formData[currentIndex].data = item
        saveButton?.isEnabled = true
        tableView.reloadData()
    }
}
