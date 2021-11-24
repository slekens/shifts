//
//  ShiftTableViewCell.swift
//  Shifts
//
//  Created by Abraham Abreu on 22/11/21.
//

import UIKit

class ShiftTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet fileprivate weak var lblTitle: UILabel!
    @IBOutlet fileprivate weak var lblHour: UILabel!
    @IBOutlet fileprivate weak var statusIcon: UIImageView!

    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
        setupIcon()
    }

    // MARK: - Setup
    func configure(model: Shift) {
        lblTitle.text = model.name + "(\(model.role))" + Formatters.shortDate(date: model.startDate)
        lblHour.text = Formatters.workSchedule(startDate: model.startDate, endDate: model.endDate)
        statusIcon.tintColor = model.getViewColor()
    }
}

// MARK: Private
private extension ShiftTableViewCell {
    
    func setupIcon() {
        statusIcon.image = UIImage(systemName: "largecircle.fill.circle")
    }
}
