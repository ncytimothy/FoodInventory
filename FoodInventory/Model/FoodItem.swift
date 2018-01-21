//
//  User.swift
//  FoodInventory
//
//  Created by james luo on 1/20/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import Foundation
import Firebase

public struct FoodItem {
    var foodName: String? = "foodName"
    var servings: Double? = 0.0
    var foodImage: UIImage?
  
    init(dictionary: [String:AnyObject]) {
        foodName = dictionary["name"] as? String
        servings = dictionary["servings"] as? Double
        foodImage = UIImage(named: foodName!)
    }
    
    static func foodItemsFromResults(_ results: [[String:AnyObject]]) -> [FoodItem] {
        
        var foodItems = [FoodItem]()
        
        for result in results {
            foodItems.append(FoodItem(dictionary: result))
        }
        
        return foodItems
    }
}

var foodItems = [FoodItem]()
