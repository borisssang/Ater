//
//  OrderViewModel.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/20/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class OrderViewModel {
    public var ProductId: Int!
    public var Comment = ""
    
    init(productId: Int) {
        self.ProductId = productId
    }
}
