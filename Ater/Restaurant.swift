//
//  Restaurant.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation

public class Restaurant {
    public var id: Int!
    public var name: String!
    public var city: String!
    public var address: String!
    public var phoneNumber: String!
    public var phoneNumber2: String!
    public var capacity: Int!
    
    init(id: Int, name: String, city: String, address: String, phoneNumber: String, phoneNumber2: String, capacity: Int) {
        self.id = id
        self.name = name
        self.city = city
        self.address = address
        self.phoneNumber = phoneNumber
        self.phoneNumber2 = phoneNumber2
        self.capacity = capacity
    }
}
