//
//  File.swift
//  
//
//  Created by Muhammad Shayan Zahid on 05/07/2023.
//

import UIKit
import SmilesSharedServices
import SmilesUtilities
import SmilesFontsManager


protocol CellConfigurable {
    var title: String { get }
    var content: String { get }
    var isHidden: Bool? { get }
}



public class FAQTableViewCell: UITableViewCell{
    
    

    // MARK: - OUTLETS -
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dropdownImageView: UIImageView!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    public var bottomViewIsHidden: Bool {
        didSet {
            self.bottomView.isHidden = bottomViewIsHidden
        }
    }
    
    // MARK: - LIFECYCLE -
    
    public override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
//    func setupCellsetupCell<T: CellConfigurable>(model: T) {
//        
//        
//        titleLabel.text = model.title
//        descriptionLabel.attributedText(model.content.htmlToAttributedString, style: .smilesBody2,
//                                        alignment: AppCommonMethods.languageIsArabic() ? .right : .left)
//        dropdownImageView.image = UIImage(named: (model.isHidden ?? true) ? "faq_dropdown" : "faq_collapse", in: .module, compatibleWith: nil)
//        titleLabel.semanticContentAttribute = AppCommonMethods.languageIsArabic() ? .forceRightToLeft : .forceLeftToRight
//        
//    }
    
    public func setupCell<T>(model: T) {
            if let configurableModel = model as? CellConfigurable {
                titleLabel.text = configurableModel.title
                descriptionLabel.text = configurableModel.content
                dropdownImageView.image = UIImage(named: (configurableModel.isHidden ?? true) ? "dropdown" : "collapse")
            } else {
                // Handle the case where the model does not conform to CellConfigurable
                // You may want to log an error or set default values for the UI elements.
                print("Warning: Model does not conform to CellConfigurable")
            }
        }
    
    
}
