//
//  SheetTitleHeaderTableViewCell.swift
//  House
//
//  Created by Usman Tarar on 19/03/2020.
//  Copyright © 2020 Ahmed samir ali. All rights reserved.
//

import UIKit
import SmilesUtilities

struct SheetTitleHeaderTableViewCellModel {
    var title: String = ""
    var text: String = ""
    var partnerCode: String = ""
    var isUnderlined: Bool = false
    var color: UIColor = .appDarkGrayColor
    var font: UIFont = UIFont.latoBoldFont(size: 20)
}

class SheetTitleHeaderTableViewCell: SuperTableViewCell {
    // MARK: - IBOutlet

    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateCell(rowModel: BaseRowModel) {
        super.updateCell(rowModel: rowModel)
        
        if let model = rowModel.rowValue as? SheetTitleHeaderTableViewCellModel {
            self.lblTitle.text = model.title
            if model.isUnderlined {
                self.lblTitle.underline(color: model.color)
            }
            
            self.lblTitle.font = model.font
            self.lblTitle.textColor = model.color
            
            if rowModel.isSelected {
                self.accessoryView = UIImageView(image: UIImage(named: "check-mark"))
            } else {
                self.accessoryView = nil
            }
        }
                
    }

    // MARK: - Cell Provider

    // __________________________________________________________________________________
    //

    class func rowModel(model: SheetTitleHeaderTableViewCellModel?) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "SheetTitleHeaderTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        return rowModel
    }
}
