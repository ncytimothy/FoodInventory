//
//  Product.swift
//  FoodInventory
//
//  Created by Timothy Ng on 1/21/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import Foundation
import UIKit

public struct Product {
    var productName: String? = "productName"
    var price: Double?
    var productImage: UIImage!
    
    init(dictionary: [String:AnyObject]) {
        productName = dictionary["productName"] as? String
        price = dictionary["price"] as? Double
        productImage = dictionary["productImage"] as? UIImage
    }
}

var products = [Product]()
public var prices = [String:Double]()

