//
//  MapPin.swift
//  testBezier
//
//  Created by Andy on 2017/3/24.
//  Copyright © 2017年 Andy. All rights reserved.
//

import UIKit

extension UIImage {
    fileprivate func makeMapPin(_ size: CGSize, color: UIColor) -> UIImage {
        let size = CGSize(width: size.width * 3, height: size.height * 1.25 * 3)
        let angWidth = size.width * 0.4
        let angY = size.height - angWidth * 0.85
        
        //// General Declarations
        UIGraphicsBeginImageContext(size)
        
        //// Oval Drawing
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.width))
        color.setFill()
        ovalPath.fill()
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: size.width * 0.3, y: angY))
        bezierPath.addLine(to: CGPoint(x: size.width * 0.5, y: size.height))
        bezierPath.addLine(to: CGPoint(x: size.width * 0.7, y: angY))
        bezierPath.addLine(to: CGPoint(x: size.width * 0.3, y: angY))
        bezierPath.close()
        color.setFill()
        bezierPath.fill()
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func addMapPin(_ color: UIColor) -> UIImage {
        return mergeImage(makeMapPin(self.size, color: color), self)
    }
    
    fileprivate func mergeImage(_ img1: UIImage, _ img2: UIImage) -> UIImage {
        let size = CGSize(width: img2.size.width, height: img2.size.height * 1.25)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        img1.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        img2.draw(in: CGRect(x: 0, y: 0, width: img2.size.width, height: img2.size.height))
        
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
