//
//  FormTableViewCell.swift
//  Shifts
//
//  Created by Abraham Abreu on 23/11/21.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblData: UILabel!
    @IBOutlet weak var formIcon: UIImageView!

    // MARK: - Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Setup
    func configure(model: FormModel) {
        lblTitle.text = model.title
        lblData.text = model.data
        formIcon.image = UIImage(systemName: model.iconName.rawValue)
    }
}
