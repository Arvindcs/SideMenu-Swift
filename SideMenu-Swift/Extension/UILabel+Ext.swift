//
//  UILabel+Ext.swift
//  SwiftEasyExtension
//
//  Created by Arvind on 07/03/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UILabel {
    
    func configureNameForCell(_ hidden: Bool = false, line: Int = 1, txtColor: UIColor = .white, fontSize: CGFloat = 12.0, isTxt: String = "", fontN: String = fontNamedBold) {
        text = isTxt
        font = UIFont(name: fontN, size: fontSize)
        textColor = txtColor
        isHidden = hidden
        numberOfLines = line
        textAlignment = .center
        lineBreakMode = .byClipping
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureMenuTitle(_ parent: UIView, line: Int = 1, txtColor: UIColor = .black, fontSize: CGFloat = 12.0, isTxt: String = "", fontN: String = fontNamed) {
        frame = CGRect(x: 70, y: 55, width: 100, height: 30)
        text = isTxt
        font = UIFont(name: fontN, size: fontSize)
        textColor = txtColor
        numberOfLines = line
        textAlignment = .left
        parent.addSubview(self)
    }
}
