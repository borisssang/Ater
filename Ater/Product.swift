//
//  MenuItem.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class Product {
    public var id: Int!
    public var name: String!
    public var description: String!
    public var image: [UInt8]!
    public var ingredients: [Ingredient]?
    public var price: Decimal!
    public var timesOrdered: Int!
    public var weight: Int!
    
    init(id: Int, name: String, description: String, image: [UInt8], price: Decimal, timesOrdered: Int, weight: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.price = price
        self.timesOrdered = timesOrdered
        self.weight = weight
    }
}
