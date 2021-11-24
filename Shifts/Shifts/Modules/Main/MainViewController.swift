//
//  ViewController.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    private var presenter: MainPresenter?
    private var shifts: [Shift] = []

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}
// MARK: - Private
private extension MainViewController {
    
    func setup() {
        self.title = Constants.ViewTitles.MainTitle
        presenter = MainPresenter(with: self)
        presenter?.fetchData()
        setupTableView()
        setupBarButton()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.CellNames.ShiftCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.CellIdentifier.MainIdentifier)
    }
    
    func setupBarButton() {
        let addShiftButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .plain, target: self, action: #selector(addNewShift))
        self.navigationItem.rightBarButtonItem = addShiftButton
    }
}

// MARK: - Objc Functions
@objc extension MainViewController {
    
    func addNewShift() {
        let detailViewController = DetailViewController(nibName: Constants.ViewControllers.DetailViewController, bundle: Bundle.main)
        detailViewController.dataSource = presenter?.dataSource
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

// MARK: - Shifts DataSource
extension MainViewController: MainView {
    func setShifts(list: [Shift]) {
        shifts = list
        tableView.reloadData()
    }
}

// MARK: - TableView Delegate
extension MainViewController: UITableViewDelegate { }

// MARK: - TableView DataSource
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifier.MainIdentifier, for: indexPath) as? ShiftTableViewCell else { return UITableViewCell() }
        let shift = shifts[indexPath.row]
        cell.configure(model: shift)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shifts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

