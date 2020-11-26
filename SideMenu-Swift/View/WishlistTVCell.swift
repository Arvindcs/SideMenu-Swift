//
//  ProductTVCell.swift
//  Fashi
//
//  Created by Jack Ily on 24/03/2020.
//  Copyright © 2020 Jack Ily. All rights reserved.
//

import UIKit

class ProductTVCell: UITableViewCell {
    
    //MARK: - Properties
    static let identifier = "ProductTVCell"
    let containerView = UIView()
    let imgView = UIImageView()
    let titleLbl = UILabel()

    var product: Product! {
        didSet {
            titleLbl.text = product.productDiscription
            imgView.image = UIImage(named: product.imageName)
            containerView.backgroundColor = UIImage(named: product.imageName)?.getPixelColor(pos: CGPoint(x: 5, y: 5))
        }
    }
    
    //MARK: - Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        containerView.layer.opacity = 0.8
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        containerView.layer.opacity = 1.0
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        containerView.layer.opacity = 1.0
        super.touchesCancelled(touches, with: event)
    }
}

//MARK: - Configures

extension ProductTVCell {
    
    func configureCell() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 8.0
        
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 8.0
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        //TODO: - ImgageView
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.image = UIImage(named: "nike-shoes-two")
        containerView.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
     
        //TODO: - TitleLbl
        titleLbl.configureNameForCell(false, txtColor: .white, fontSize: 17.0, isTxt: "CATEGORIES", fontN: fontNamedBold)
        titleLbl.textAlignment = .center
        containerView.insertSubview(titleLbl, aboveSubview: imgView)
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5.0),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0),
        ])
        
        NSLayoutConstraint.activate([
            imgView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imgView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imgView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imgView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            titleLbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            titleLbl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 40),
            titleLbl.leadingAnchor.constraint(lessThanOrEqualTo: containerView.leadingAnchor, constant: 5.0),
            titleLbl.trailingAnchor.constraint(lessThanOrEqualTo: containerView.trailingAnchor, constant: 5.0),
        ])
    }
}
