//
//  UIButton+Ext.swift
//  SwiftEasyExtension
//
//  Created by Arvind on 07/03/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIButton {
    
    func configureMenuButton(_ parentV: UIView, imgNamed: String = "text.alignleft", selector: Selector, controller: UIViewController) {
        frame = CGRect(x: 30, y: 55, width: 30, height: 30)
        setImage(UIImage(named: imgNamed), for: .normal)
        addTarget(controller, action: selector, for: .touchUpInside)
        parentV.addSubview(self)
    }
    
    func configureBackBtn(_ parentV: UIView, selector: Selector, controller: UIViewController) {
        frame = CGRect(x: -15.0, y: 0.0, width: 40.0, height: 40.0)
        setImage(UIImage(named: "text.alignleft"), for: .normal)
        addTarget(controller, action: selector, for: .touchUpInside)
        parentV.addSubview(self)
    }
    
    func configureBagButton(_ parentV: UIView, imgNamed: String = "bag-icon", selector: Selector, controller: UIViewController = UIViewController()) {
        frame = CGRect(x: frame.size.width - 40, y: frame.size.height - 30, width: 40.0, height: 40.0)
        setImage(UIImage(named: "bag-icon"), for: .normal)
        backgroundColor = .red
        parentV.addSubview(self)
    }
    
    func configureAddBtn(_ view: UIView, selector: Selector, vc: UIViewController) {
        frame = CGRect(x: -10.0, y: 0.0, width: 40.0, height: 40.0)
        setImage(UIImage(named: "text.alignleft"), for: .normal)
        addTarget(vc, action: selector, for: .touchUpInside)
        view.addSubview(self)
    }
    
}
