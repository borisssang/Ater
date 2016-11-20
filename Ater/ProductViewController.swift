//
//  ProductViewController.swift
//  Ater
//
//  Created by Nikola Bozhkov on 11/20/16.
//  Copyright © 2016 Nikola Bozhkov. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    public var product: Product!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleIngredientsLoaded), name: .onIngredientsLoaded, object: nil)
        RestaurantService.loadProductIngredients(productId: product.id)
        
        self.descriptionLabel.text = self.product.description
    }
    
    @objc private func handleIngredientsLoaded(notification: Notification) {
        self.product.ingredients = (notification.object as! [Ingredient])
        print(self.product.ingredients ?? "no data")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
