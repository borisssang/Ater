//
//  MenuItemTableViewCell.swift
//  Ater
//
//  Created by Boris Angelov on 11/14/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfDish: UILabel!
    @IBOutlet weak var ingridients: UILabel!
    
    
    var menuItem: MenuItem? {
        didSet {
            updateUI()
        }
    }
    private func updateUI()
    {
        nameOfDish.attributedText = nil
        ingridients.text = nil
        
        if let item = self.menuItem
        {
        nameOfDish?.text = item.name
        ingridients?.text = item.ingridients
        }
        
    }
    
    
    
    
    
    @IBAction func orderMeal(_ sender: UIButton) {
    }

}
