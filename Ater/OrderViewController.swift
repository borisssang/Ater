//
//  OrderViewController.swift
//  Ater
//
//  Created by Boris Angelov on 11/20/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.priceLabel.text = Order.price.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func placeOrder(_ sender: Any) {
        RestaurantService.placeOrder()
        Order.orderList = [Product]()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.priceLabel.text = "0"
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Order.orderList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as! ProductTableViewCell
        
        // Configure the cell...
        let product = Order.orderList[indexPath.row]
        cell.nameLabel.text = product.name
        cell.priceLabel.text = product.price.description
        cell.descriptionLabel.text = product.description
        
        return cell
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
