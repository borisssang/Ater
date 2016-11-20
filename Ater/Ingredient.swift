//
//  Ingredient.swift
//  Ater
//
//  Created by Boris Angelov on 11/19/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation

public class Ingredient {
    public var id: Int!
    public var name: String!
    public var isAllergen: Bool!
    public var included = true
    
    init(id: Int, name: String, isAllergen: Bool) {
        self.id = id
        self.name = name
        self.isAllergen = isAllergen
    }
}
