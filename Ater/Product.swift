//
//  MenuItem.swift
//  Ater
//
//  Created by Boris Angelov on 11/19/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation

public class Product {
    public var id: Int!
    public var name: String!
    public var description: String!
    public var image: String!
    public var ingredients: [Ingredient]?
    public var price: Decimal!
    public var timesOrdered: Int!
    public var weight: Int!
    
    init(id: Int, name: String, description: String, image: String, price: Decimal, timesOrdered: Int, weight: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.image = image
        self.price = price
        self.timesOrdered = timesOrdered
        self.weight = weight
    }
}
