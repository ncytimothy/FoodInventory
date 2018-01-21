//
//  ViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit
var CurUser = User(UserName: "test")
var CurIndex = 0
class FoodTableViewController: UITableViewController {
    
    // MARK: Properties
   // var hardcodedFood = ["Bananas", "Oranges"]

    
    // MARK: TableView Delegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        while CurIndex < CurUser.UserItems.count{
            var cell = UITableViewCell()
            tableView.addSubview(cell)
            CurIndex += 1
        }
        CurIndex = 0
        return CurUser.UserItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodTableViewCell
            cell.foodLabel.text = CurUser.UserItems[CurIndex].ItemName
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! FoodDetailViewController
        CurIndex = indexPath.row
        detailVC.foodName = CurUser.UserItems[CurIndex].ItemName
        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    // MARK: Action
    @IBAction func addPressed(_ sender: Any) {
        let addInventoryVC = storyboard?.instantiateViewController(withIdentifier: "addFoodPickerVC") as! UIViewController
        self.navigationController?.pushViewController(addInventoryVC, animated: true)
    }
    


}

