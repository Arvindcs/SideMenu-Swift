//
//  ProductCVCell.swift
//  Fashi
//
//  Created by Jack Ily on 23/03/2020.
//  Copyright © 2020 Jack Ily. All rights reserved.
//

import UIKit

protocol ProductCVCellDelegate: class {
    func handleRemoveItem(_ cell: ProductCVCell)
}

class ProductCVCell: UICollectionViewCell {
    
    //MARK: - Properties
    static let identifier = "ProductCVCell"
    weak var delegate: ProductCVCellDelegate?
    
    let imgView = UIImageView()
    let nameLbl = UILabel()
    let containerView = UIView()
    let bagButton = UIButton()
    
    var product: Product! {
        didSet {
            nameLbl.text = product.productName
            imgView.image = UIImage(named: product.imageName)
            containerView.backgroundColor = UIImage(named: product.imageName)?.getPixelColor(pos: CGPoint(x: 5, y: 5))
        }
    }
    
    //MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 0.8
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 1.0
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        layer.opacity = 1.0
        super.touchesCancelled(touches, with: event)
    }
}

//MARK: - Configures

extension ProductCVCell {
    
    func configureCell() {
        backgroundColor = UIColor.clear
        containerView.setupShadowForView(contentView, cornerR: 10.0)
        
        imgView.configureIMGViewForCell(containerView, imgName: "nike-shoes-one")
        imgView.layer.cornerRadius = 10.0
        imgView.contentMode = .scaleToFill
        
        bagButton.frame = CGRect(x: frame.size.width - 40, y: frame.size.height - 30, width: 40.0, height: 40.0)
        bagButton.setImage(UIImage(named: "bag-icon"), for: .normal)
        bagButton.backgroundColor = .red
        bagButton.layer.cornerRadius = 10
        containerView.addSubview(bagButton)
        
        //TODO: - nameLbl
        //bagButton.configureBagButton(containerView, imgNamed: "bag-icon", selector: #selector(bagButtonPressed))
        nameLbl.configureNameForCell(false, line: 2, txtColor: .white, fontSize: 17.0, fontN: fontNamedBold)
        containerView.addSubview(nameLbl)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0),
            containerView.heightAnchor.constraint(equalToConstant: 250),
            
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imgView.heightAnchor.constraint(equalToConstant: 200),
            
            nameLbl.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 200),
            nameLbl.heightAnchor.constraint(equalToConstant: 30),
            nameLbl.centerXAnchor.constraint(equalTo: self.containerView.centerXAnchor),
            nameLbl.centerYAnchor.constraint(equalTo: self.containerView.centerYAnchor),

        ])
        
        setupDarkMode()
    }
    
    @objc
    func bagButtonPressed() {
    
    }
}

//MARK: - DarkMode

extension ProductCVCell {
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupDarkMode()
    }
    
    private func setupDarkMode() {
        if #available(iOS 12.0, *) {
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified: setupDarkModeView()
            case .dark: setupDarkModeView(true)
            default: break
            }
        } else {
            setupDarkModeView()
        }
    }
    
    private func setupDarkModeView(_ isDarkMode: Bool = false) {
        let conC: UIColor = isDarkMode ? .white : .black
        containerView.layer.shadowColor = conC.cgColor
        nameLbl.textColor = isDarkMode ? .lightGray : .white
    }
}
