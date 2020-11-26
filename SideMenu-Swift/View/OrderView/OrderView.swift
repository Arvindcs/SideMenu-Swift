//
//  OrderView.swift
//  SideMenu-Swift
//
//  Created by Arvind on 26/11/20.
//

import UIKit

class OrderView: UIView {

    private var parentVC: MainVC!
    public  let menuButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension OrderView {
    
    func setupHomeView(_ parent: MainVC) {
        parentVC = parent
        frame = CGRect(x: 0.0, y: 0.0, width: screenWidth, height: screenHeight)
        setupNavi()
        
    }
    
    func setupNavi() {
        //TODO -
        menuButton.configureMenuButton(self, imgNamed: "menu", selector: #selector(parentVC?.bagDidTap), controller: parentVC!)
        menuButton.tag = 1
        addSubview(menuButton)
    }
}
