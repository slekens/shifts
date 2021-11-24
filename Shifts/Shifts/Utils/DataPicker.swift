//
//  DataPicker.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import UIKit

// MARK: - Data Protocol
protocol DataPickerDelegate: AnyObject {
    func didSelectItem(item: String)
}

class DataPicker: UIView {
    
    // MARK: - Properties
    private var type: TypeForm?
    private var pickerView = UIPickerView()
    private var doneToolbar = UIToolbar()
    private let viewHeight = UIScreen.main.bounds.height / 3
    private var currentSelection = ""
    private var data: [String] = []
    
    weak var delegate: DataPickerDelegate?
    
    // MARK: - Initialization
    init(with type: TypeForm) {
        self.type = type
        super.init(frame: UIScreen.main.bounds)
        setup()
        setDataSource(type: type)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension DataPicker {
    
    func setup() {
        self.backgroundColor = .clear
        pickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: viewHeight)
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        self.addSubview(pickerView)
        setupToolbar()
        presentPicker()
    }

    func presentPicker() {
        UIView.animate(withDuration: 0.2) {
            self.pickerView.frame.origin.y = UIScreen.main.bounds.height - self.viewHeight
            self.doneToolbar.frame.origin.y = UIScreen.main.bounds.height - self.viewHeight
        }
    }
    
    func setupToolbar() {
        doneToolbar.sizeToFit()
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneAction))
        doneToolbar.setItems([spaceButton, doneButton], animated: true)
        doneToolbar.isUserInteractionEnabled = true
        doneToolbar.frame = CGRect(x: 0, y: pickerView.frame.origin.y, width: UIScreen.main.bounds.width, height: 44)
        doneToolbar.backgroundColor = .systemGray
        self.addSubview(doneToolbar)
    }
    
    func setDataSource(type: TypeForm) {
        switch type {
        case .date:
            data = []
        case .employee:
            data = PickersDataSource.getEmployeeData()
        case .role:
            data = PickersDataSource.getRoleData()
        case .color:
            data = PickersDataSource.getColorData()
        }
        currentSelection = data[0]
        pickerView.reloadAllComponents()
    }
}

// MARK: - Actions
@objc extension DataPicker {
    
    func doneAction() {
        delegate?.didSelectItem(item: currentSelection)
        self.removeFromSuperview()
    }
}

// MARK: - Picker Delegate
extension DataPicker: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSelection = data[row]
    }
}

// MARK: - Picker Data Source
extension DataPicker: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
}
