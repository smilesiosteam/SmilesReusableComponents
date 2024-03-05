//
//  SheetValuesTableViewCell.swift
//  House
//
//  Created by Usman Tarar on 19/03/2020.
//  Copyright © 2020 Ahmed samir ali. All rights reserved.
//

import UIKit
import SmilesUtilities

class SheetValuesTableViewCell: SuperTableViewCell {
    // MARK: - IBOutlet
    
    @IBOutlet weak var lblTitle1: UILabel!
    @IBOutlet weak var lblTitle2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        lblTitle1.semanticContentAttribute = AppCommonMethods.languageIsArabic() ? .forceRightToLeft : .forceLeftToRight
        lblTitle2.semanticContentAttribute = AppCommonMethods.languageIsArabic() ? .forceRightToLeft : .forceLeftToRight
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - UpdateCell
    
    override func updateCell(rowModel: BaseRowModel) {
        super.updateCell(rowModel: rowModel)
        
        if let model = rowModel.rowValue as? SheetValuesTableViewCellModel {
            lblTitle1.text = model.title1
            lblTitle2.text = model.title2
            
            lblTitle1.font = model.title1Font
            lblTitle2.font = model.title2Font
            
            lblTitle1.textColor = model.title1Color
            lblTitle2.textColor = model.title2Color
            
            lblTitle1.isHidden = model.title1.isEmpty
            lblTitle2.isHidden = model.title2.isEmpty
            
            if let isHtmlText = model.isHTMLText, isHtmlText {
                lblTitle2.isHidden = true
                lblTitle1.font = model.title1Font
                lblTitle1.attributedText = model.title1.htmlToAttributedString
            } else {
                if model.isAttributedText.asBoolOrFalse() {
                    lblTitle2.isHidden = true
                    if model.title3.isEmpty{
                        lblTitle1.updateLabelTextStyle(fullText: model.title1, styledText: model.title2, fullStringAttributes: [.font: UIFont.latoMediumFont(size: 13), .foregroundColor: UIColor.appGreyColor_128], styledStringAttributes: [.foregroundColor: model.title2Color ?? UIColor.appRedColor, .font: UIFont.latoMediumFont(size: 13)])
                    }
                    else{
                        let styleText = [model.title2, model.title3]
                        let fullText = model.title1
                        let paragraphStyle = NSMutableParagraphStyle()
                        paragraphStyle.lineSpacing = 2 // Whatever line spacing you want in points

                        lblTitle1.formatLabelStyle(fullText: fullText, styledText: styleText, fullStringAttributes: [.font: UIFont.latoMediumFont(size: 13), .foregroundColor: UIColor.appGreyColor_128, .paragraphStyle: paragraphStyle], styledStringAttributes: [[.foregroundColor: model.title2Color ?? UIColor.appRedColor, .font: model.title2Font!],[.foregroundColor: model.title3Color ?? UIColor.appRedColor, .font: model.title3Font!]])
                        
                        
                    }
                }
            }
        }
    }
    
    // MARK: - Cell Provider
    
    // __________________________________________________________________________________
    //
    
    class func rowModel(model: SheetValuesTableViewCellModel?) -> BaseRowModel {
        let rowModel = BaseRowModel()
        rowModel.rowCellIdentifier = "SheetValuesTableViewCell"
        rowModel.rowHeight = UITableView.automaticDimension
        rowModel.rowValue = model
        return rowModel
    }
}
