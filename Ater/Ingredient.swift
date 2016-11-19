//
//  Ingredient.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class Ingredient {
    public var id: Int!
    public var name: String!
    public var isAllergen: Bool!
    
    init(id: Int, name: String, isAllergen: Bool) {
        self.id = id
        self.name = name
        self.isAllergen = isAllergen
    }
}
