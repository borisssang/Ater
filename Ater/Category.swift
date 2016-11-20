//
//  Category.swift
//  Ater
//
//  Created by Boris Angelov on 11/19/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation

public class Category {
    public var id: Int!
    public var name: String!
    public var image: String!
    public var menuItems: [Product]?
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
