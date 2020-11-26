//
//  UIView+Ext.swift
//  SwiftEasyExtension
//
//  Created by Arvind on 07/03/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIView {

    func setupShadowForView(_ parentV: UIView, cornerR: CGFloat = 8.0) {
        self.setupContainerView(cornerR: cornerR)
        parentV.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupContainerView(cornerR: CGFloat = 8.0) {
        backgroundColor = .white
        clipsToBounds = true
        layer.cornerRadius = cornerR
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: -1.0, height: 1.0)
        layer.shadowRadius = 4.0
        layer.shadowOpacity = 0.3
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

