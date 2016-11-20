//
//  Order.swift
//  Ater
//
//  Created by Boris Angelov on 11/20/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation

public class Order {
    public static var orderList = [Product]()
    
    public static var price: Decimal {
        var count: Decimal = 0
        
        for product in orderList {
            count += product.price
        }
        
        return count
    }
}
