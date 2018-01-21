//
//  PurchaseViewController.swift
//  FoodInventory
//
//  Created by Timothy Ng on 1/21/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {

    
    var foodImage: UIImage!
    var foodName: String!
    var foodPrice: Double!
    var cost: Double!
    
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodImageView.image = foodImage
        foodLabel.text = foodName
        servingsLabel.text = "1.0"
        stepper.minimumValue = 1.0
        
        costLabel.text = "$" + String(foodPrice * 1)
    }
    
    @IBAction func stepperPressed(_ sender: Any) {
        servingsLabel.text = String(stepper.value)
        cost = (stepper.value * foodPrice)
        costLabel.text = "$" + String(format: "%.2f", cost)
        
    }
    
    @IBAction func purchasePressed(_ sender: Any) {
        let foodItemDict = ["name":self.foodName, "servings": self.stepper.value] as [String : AnyObject]
        var foodItem = FoodItem(dictionary: foodItemDict)
        foodItems.append(foodItem)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    

    
    

}
