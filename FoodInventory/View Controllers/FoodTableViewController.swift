//
//  ViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
  
    @IBOutlet var foodTableView: UITableView!
    
    // MARK: Properties
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
 


    // MARK: Life cycle
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
  override func viewDidLoad() {
        super.viewDidLoad()
        self.foodTableView.rowHeight = 330.0
        tableView.remembersLastFocusedIndexPath = true
        presentLoadingAlert()
        Client.sharedInstance().updateDatabase(completionHandler: {(success, userItem, error) in DispatchQueue.main.async {
            if success {
                self.foodTableView.reloadData()
                self.alert.dismiss(animated: true, completion: nil)
                }
            }
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        StoreViewController.sharedInstance().createProduct({(success) in
            
        })
    }
    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         var foodNames = ["Rice", "Apples", "Oranges", "Apples", "Bread", "Beef"]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
       
        if let foodName = foodItems[indexPath.row].foodName {
            
            if foodNames.contains(foodName) {
                cell.foodLabel.text = foodName
                cell.foodImage.image = UIImage(named: foodName)
            } else {
                cell.foodImage.image = UIImage(named: "FI")
            }
        }
       
        
        
       
       
        cell.alertTriangle.isHidden = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! FoodDetailViewController
        
        detailVC.foodName = foodItems[indexPath.row].foodName
        print("\(foodItems[indexPath.row].foodName)")
        
        if let price = prices[foodItems[indexPath.row].foodName!] {
            detailVC.foodCost = price
        } else {
            detailVC.foodCost = 5
        }
        
        if let foodImage = foodItems[indexPath.row].foodImage {
            detailVC.image = foodImage
        } else {
            detailVC.image = UIImage(named: "FI")
        }
        
        detailVC.foodLeft = foodItems[indexPath.row].servings
        
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    // MARK: Action
    @IBAction func addPressed(_ sender: Any) {
        let addInventoryVC = storyboard?.instantiateViewController(withIdentifier: "addFoodPickerVC") as! UIViewController
        self.navigationController?.pushViewController(addInventoryVC, animated: true)
    }
    
    private func presentLoadingAlert() {
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    
}

