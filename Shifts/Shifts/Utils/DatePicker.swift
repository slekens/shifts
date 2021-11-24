//
//  FormPickers.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import UIKit

// MARK: - Data Protocol
protocol DatePickerDelegate: AnyObject {
    func didSelectDate(date: String)
}

class DatePicker: UIView {
    
    // MARK: - Properties
    private var blurEffect: UIBlurEffect?
    private var blurEffectView: UIVisualEffectView?
    private var datePicker: UIDatePicker?
    private var type: TypeForm?
    private var dateSelected: String = Formatters.formDate(date: Date())
    
    weak var delegate: DatePickerDelegate?
    
    // MARK: - Initialization
    init(with type: TypeForm) {
        self.type = type
        super.init(frame: UIScreen.main.bounds)
        setup()
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
private extension DatePicker {
    
    func setup() {
        blurEffect = UIBlurEffect(style: .light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView?.translatesAutoresizingMaskIntoConstraints = false
        createDatePicker()
        setupPickerHierarchy()
        setupHierarchy()
        setupConstraints()
        setupViewButtons()
    }
    
    func setupHierarchy() {
        if let blurView = blurEffectView {
            self.addSubview(blurView)
            setupConstraints()
        }
    }
    
    func setupConstraints() {
        blurEffectView?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0.0).isActive = true
        blurEffectView?.topAnchor.constraint(equalTo: self.topAnchor, constant: 0.0).isActive = true
        blurEffectView?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0.0).isActive = true
        blurEffectView?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
    }
    
    // I set a minimun date until today and two years in future like bussiness rule.
    func createDatePicker() {
        let frame = CGRect(x: UIScreen.main.bounds.width / 2 - 150, y: 80, width: 300, height: 300)
        datePicker = UIDatePicker(frame: frame)
        datePicker?.minimumDate = Calendar.current.date(byAdding: .year, value: 0, to: Date())
        datePicker?.maximumDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())
        datePicker?.preferredDatePickerStyle = .inline
        datePicker?.addTarget(self, action: #selector(dateSelection(_:)), for: .valueChanged)
    }
    
    func setupPickerHierarchy() {
        if let picker = datePicker {
            blurEffectView?.contentView.addSubview(picker)
        }
    }
    
    func setupViewButtons() {
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Set Date", for: .normal)
        closeButton.contentHorizontalAlignment = .center
        closeButton.addTarget(self, action: #selector(closePicker), for: .touchUpInside)
        if let blurView = blurEffectView {
            blurView.contentView.addSubview(closeButton)
            closeButton.translatesAutoresizingMaskIntoConstraints = false
            closeButton.topAnchor.constraint(equalTo: blurView.topAnchor, constant: 30.0).isActive = true
            closeButton.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: 0.0).isActive = true
            closeButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
            closeButton.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        }
    }
}

// MARK: - Objc Implementation
@objc extension DatePicker {
    
    func dateSelection(_ sender: UIDatePicker) {
        let stringDate = Formatters.formDate(date: sender.date)
        dateSelected = stringDate
    }
    
    func closePicker() {
        delegate?.didSelectDate(date: dateSelected)
        self.removeFromSuperview()
    }
}
