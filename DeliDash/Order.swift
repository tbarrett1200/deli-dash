//
//  Order.swift
//  DeliDash
//
//  Created by Alexander Leininger on 8/27/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import Foundation

class Order {
    static var foodType: String = ""
    static var foodList:[String]=[]
    
    static func numberOfBreads() -> Int {
        var breadCount = 0
        
        for breadType in ["Sub Roll","Kaiser Roll","Rye","Wheat","Wrap","Ciabatta"] {
            if foodList.contains(breadType) {
                breadCount = breadCount + 1
            }
        }
        
        return breadCount;
    }
}
    
    