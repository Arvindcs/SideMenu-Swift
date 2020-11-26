//
//  UIImage+Ext.swift
//  SwiftEasyExtension
//
//  Created by Arvind on 05/03/2020.
//  Copyright © 2020 Arvind. All rights reserved.
//

import UIKit

extension UIImage {
    
    func imgWithColor(_ color: UIColor, with size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        color.setFill()
        
        let rect = CGRect(x: 0.0, y: -6.0, width: size.width, height: size.height)
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        return image!
    }
    
    func getPixelColor(pos: CGPoint) -> UIColor {
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        
        let r = CGFloat(data[pixelInfo]) / CGFloat(255.0)
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0)
        let b = CGFloat(data[pixelInfo+2]) / CGFloat(255.0)
        let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0)
        
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
