//
//  SheetValuesTableViewCellModel.swift
//  House
//
//  Created by Usman Tarar on 29/03/2020.
//  Copyright © 2020 Ahmed samir ali. All rights reserved.
//

import UIKit


class SheetValuesTableViewCellModel {
    var title1 = ""
    var title2 = ""
    var title3 = ""
    var title1Font:UIFont?
    var title2Font: UIFont?
    var title3Font: UIFont?
    var title1Color: UIColor?
    var title2Color: UIColor?
    var title3Color: UIColor?

    var isAttributedText: Bool?
    var isHTMLText: Bool?

    init(title1: String = "", title2: String = "", title3: String = "",title1Font: UIFont = UIFont(name: "Lato-Regular", size: 14.0)!, title2Font: UIFont = UIFont(name: "Lato-Regular", size: 14.0)!,title3Font: UIFont = UIFont(name: "Lato-Regular", size: 14.0)!, title1Color: UIColor, title2Color: UIColor = .appDarkGrayColor,title3Color: UIColor = .appDarkGrayColor, isAttributedText: Bool = false, isHTMLText: Bool = false) {
        self.title1 = title1
        self.title2 = title2
        self.title3 = title3
        self.title1Font = title1Font
        self.title2Font = title2Font
        self.title3Font = title3Font
        self.title1Color = title1Color
        self.title2Color = title2Color
        self.title3Color = title3Color
        
        self.isAttributedText = isAttributedText
        self.isHTMLText = isHTMLText
    }
}
