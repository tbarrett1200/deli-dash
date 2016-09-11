//
//  Imagesizing.swift
//  DeliDash
//
//  Created by Alexander Leininger on 6/6/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

extension UIImage {
    
    
    class func scaleImageToSize(img: UIImage, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(size)
        
        img.drawInRect(CGRect(origin: CGPointZero, size: size))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return scaledImage
    }
    
}