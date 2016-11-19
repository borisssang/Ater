//
//  Category.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class Category {
    public var id: Int!
    public var name: String!
    public var image: [UInt8]!
    public var menuItems: [Product]?
    
    init(id: Int, name: String, image: [UInt8]) {
        self.id = id
        self.name = name
        self.image = image
    }
}
