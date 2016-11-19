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
    
    public func loadCategories() {
        if self.dataTask != nil {
            self.dataTask?.cancel()
        }
        
        // Indicate that the app is loading
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let url = URL(string: "\(RestaurantService.baseUrl)/api/restaurants/\(self.restaurantId)/categories")!
        
        self.dataTask = self.defaultSession.dataTask(with: url, completionHandler: {
            data, response, error in
            
            // Indicate that the app is done loading
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let res = response as? HTTPURLResponse {
                
                // If everything is fine, notify with the data
                if res.statusCode == 200 {
                    print(data ?? "no data")
                    NotificationCenter.default.post(name: .onCategoriesLoaded, object: data)
                }
            }
        })
    }
}
