//
//  FoodPickerViewController.swift
//  FoodInventory
//
//  Created by Timothy Ng on 1/20/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit

class FoodPickerViewController: UIViewController {
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Add New Food"
        
        // Do any additional setup after loading the view.
    }
    

    // MARK: Actions
    @IBAction func manualPressed(_ sender: Any) {
        
        let newFoodVC = storyboard?.instantiateViewController(withIdentifier: "newFoodVC") as! NewFoodViewController
        newFoodVC.addFoodMethodImage = UIImage(named: "button-bg-manual")
        newFoodVC.addMethodString = "Add manually"
        
       self.navigationController?.pushViewController(newFoodVC, animated: true)
    }
    
    @IBAction func storePressed(_ sender: Any) {
        
        let storeVC = storyboard?.instantiateViewController(withIdentifier: "storeVC") as! StoreViewController
       self.navigationController?.pushViewController(storeVC, animated: true)
        
        
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
