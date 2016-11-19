//
//  Category.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class Category {
    public var name: String!
    public var imageUrl: String!
    public var menuItems: [MenuItem]
    
    init(name: String, imageUrl: String, menuItems: [MenuItem]) {
        self.name = name
        self.imageUrl = imageUrl
        self.menuItems = menuItems
    }
}
