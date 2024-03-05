//
//  File.swift
//  
//
//  Created by Habib Rehman on 01/03/2024.
//

import UIKit
import SmilesUtilities

class SectionTitleTableViewCell: SuperTableViewCell {

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
        
        self.lblTitle.text = rowModel.rowTitle
    }
    
    // MARK: - Cell Provider

    // __________________________________________________________________________________
    //

    class func rowModel(title: String) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "SectionTitleTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowTitle = title
        return rowModel
    }

}

