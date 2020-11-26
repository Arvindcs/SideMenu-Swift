//
//  Product.swift
//  SideMenu-Swift
//
//  Created by Arvind on 26/11/20.
//

import Foundation

struct Product {

    var imageName: String
    var productName: String
    var productDiscription: String
}


func getProductList() -> [Product] {
    return [Product(imageName: "nike-shoes-two",
                    productName: "Nike Zoom Rival Fly 2",
                    productDiscription: "Price - ₹15,595"),
            Product(imageName: "nike-shoes-three",
                    productName: "Nike Zoom Rival Fly 3",
                    productDiscription: "Price - ₹15,595"),
            Product(imageName: "nike-shoes-four",
                    productName: "Nike Zoom Rival Fly 4",
                    productDiscription: "Price - ₹15,595")
    ]
}

func getBannerList() -> [Product] {
    return [Product(imageName: "nike-shoes-one",
                 productName: "Nike Zoom Rival Fly 2",
                 productDiscription: "Price - ₹15,595"),
         Product(imageName: "nike-shoes-one",
                 productName: "Nike Zoom Rival Fly 2",
                 productDiscription: "Price - ₹15,595")]
}
