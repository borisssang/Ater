//
//  Restaurant.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/19/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import Foundation
import UIKit

public class RestaurantService {
    private static let baseUrl = "http://ater.azurewebsites.net"
    
    private static let defaultSession = URLSession(configuration: .default)
    private static var dataTask: URLSessionDataTask?
    
    private static var restaurantId: Int!
    private static var tableId: Int!
    
    public static func setup(restaurantId: Int, tableId: Int) {
        self.restaurantId = restaurantId
        self.tableId = tableId
    }
    
    public static func loadSampleCategories() -> [Category] {
        var categories = [Category]()
        for i in 1...20 {
            let category = Category(id: i, name: "Category\(i)", image: [])
            categories.append(category)
        }
        
        return categories
    }
    
    private static func getRequest(urlPath: String, completionHandler: @escaping (_: Data?) -> Void) {
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Indicate that the app is loading
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string: urlPath)!
        
        dataTask = defaultSession.dataTask(with: url, completionHandler: {
            data, response, error in
            
            // Indicate that the app is done loading
            DispatchQueue.main.async {
                print("done")
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let res = response as? HTTPURLResponse {
                print("res", res.statusCode)
                // If everything is fine, handle the data
                if res.statusCode == 200 {
                    completionHandler(data)
                }
            }
        })
        
        dataTask?.resume()
    }
    
    public static func loadCategories() {
        let urlPath = "\(baseUrl)/api/restaurants/\(restaurantId!)/categories"
        print(urlPath)
        getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
            
            var categories = [Category]()
            for jsonCategory in json {
                let jsonDict = jsonCategory as! Dictionary<String, Any>
                
                let id = jsonDict["Id"] as! Int
                let name = jsonDict["Name"] as! String
                let image = jsonDict["Image"] as! String
                
                let category = Category(id: id, name: name, image: Array(image.utf8))
                categories.append(category)
            }
            
            NotificationCenter.default.post(name: .onCategoriesLoaded, object: categories)
        })
    }
    
    public static func loadProducts(categoryId: Int) {
        let urlPath = "\(baseUrl)/api/categories/\(categoryId)/products"
        getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]

            var products = [Product]()
            for jsonProduct in json {
                let jsonDict = jsonProduct as! Dictionary<String, Any>
                
                let id = jsonDict["Id"] as! Int
                let name = jsonDict["Name"] as! String
                let image = jsonDict["Image"] as! String
                let description = jsonDict["Description"] as! String
                let price = jsonDict["Price"] as! NSNumber
                let weight = jsonDict["Weight"] as! Int
                let timesOrdered = jsonDict["TimesOrdered"] as! Int
                
                let product = Product(id: id, name: name, description: description, image: Array(image.utf8), price: price.decimalValue, timesOrdered: timesOrdered, weight: weight)
                products.append(product)
            }

            NotificationCenter.default.post(name: .onProductsLoaded, object: products)
        })
    }
    
    public static func loadProductIngredients(productId: Int) {
        let urlPath = "\(baseUrl)/api/products/\(productId)/ingredients"
        getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
            
            var ingredients = [Ingredient]()
            for jsonIngredient in json {
                let jsonDict = jsonIngredient as! Dictionary<String, Any>
                
                let id = jsonDict["Id"] as! Int
                let name = jsonDict["Name"] as! String
                let isAllergen = jsonDict["IsAllergen"] as! Bool
                
                let ingredient = Ingredient(id: id, name: name, isAllergen: isAllergen)
                ingredients.append(ingredient)
            }
            
            NotificationCenter.default.post(name: .onIngredientsLoaded, object: ingredients)
        })
    }
}
