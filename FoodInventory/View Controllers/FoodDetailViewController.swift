//
//  FoodDetailViewController.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/20/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit

class FoodDetailViewController: UIViewController {
    
    // MARK: Properties
    var foodName: String!
    var image: UIImage!
    var foodLeft = 0
    var foodCost: Double!
    
    // MARK: Outlets

    @IBOutlet weak var Warning: UILabel!
    @IBOutlet weak var costOfFood: UILabel!
    @IBOutlet weak var foodRemaining: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var foodImage: UIImageView!
    
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        costOfFood.text = "$" + String(foodCost)
        foodImage.image = image
        foodRemaining.text = String(foodLeft) + " " + "servings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationItem.title = foodName
    }
    
    @IBAction func Use(_ sender: UIButton) {
        if (foodLeft > 0){
            foodLeft = foodLeft - 1
        }
        foodRemaining.text = String(foodLeft) + " " + "servings"
    }
    // MARK: Action
    @IBAction func buyPressed(_ sender: Any) {
        let storeVC = storyboard?.instantiateViewController(withIdentifier: "storeVC") as! StoreViewController
        self.navigationController?.pushViewController(storeVC, animated: true)
    }
    
}
