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
    private static let baseUrl = ""
    
    private let defaultSession = URLSession(configuration: .default)
    private var dataTask: URLSessionDataTask?
    
    private var restaurantId: Int!
    private var tableId: Int!
    
    init(restaurantId: Int, tableId: Int) {
        self.restaurantId = restaurantId
        self.tableId = tableId
    }
    
    private func getRequest(urlPath: String, completionHandler: @escaping (_: Data?) -> Void) {
        if self.dataTask != nil {
            self.dataTask?.cancel()
        }
        
        // Indicate that the app is loading
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string: urlPath)!
        
        self.dataTask = self.defaultSession.dataTask(with: url, completionHandler: {
            data, response, error in
            
            // Indicate that the app is done loading
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let res = response as? HTTPURLResponse {
                
                // If everything is fine, handle the data
                if res.statusCode == 200 {
                    completionHandler(data)
                }
            }
        })
    }
    
    public func loadCategories() {
        let urlPath = "\(RestaurantService.baseUrl)/api/restaurants/\(self.restaurantId)/categories"
        self.getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            print(data ?? "no data")
            NotificationCenter.default.post(name: .onCategoriesLoaded, object: data)
        })
    }
    
    public func loadProducts(categoryId: Int) {
        let urlPath = "\(RestaurantService.baseUrl)/api/categories/\(categoryId)"
        self.getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            print(data ?? "no data")
            NotificationCenter.default.post(name: .onProductsLoaded, object: data)
        })
    }
    
    public func loadProduct(productId: Int) {
        let urlPath = "\(RestaurantService.baseUrl)/api/products/\(productId)"
        self.getRequest(urlPath: urlPath, completionHandler: {
            data in
            
            print(data ?? "no data")
            NotificationCenter.default.post(name: .onProductLoaded, object: data)
        })
    }
}
