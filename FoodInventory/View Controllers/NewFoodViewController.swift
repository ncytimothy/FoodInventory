//
//  NewFoodViewController.swift
//  
//
//  Created by Timothy Ng on 1/20/18.
//

import UIKit

class NewFoodViewController: UIViewController {

    @IBAction func stepperPressed(_ sender: Any) {
        servingLabel.text = String(stepper.value)
    }
    
    
    // MARK: Properties
    var addFoodMethodImage: UIImage!
    var addMethodString: String!
    
    // MARK: Outlets
    @IBOutlet weak var addFoodTextfield: UITextField!
    @IBOutlet weak var servingLabel: UILabel!
    @IBOutlet weak var newFoodImageView: UIImageView!
    @IBOutlet weak var addMethodLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newFoodImageView.image = addFoodMethodImage
        addMethodLabel.text = addMethodString
        servingLabel.text = "1.0"
        stepper.minimumValue = 1
        stepper.stepValue = 1
    }

    @IBAction func addFoodPressed(_ sender: Any) {
        
        if addFoodTextfield.text!.isEmpty {
            presentAlert("Food empty", "Please enter a food item", "Dismiss")
            return
        }
        
            let foodItemDict = ["name":self.addFoodTextfield.text, "servings": self.stepper.value] as [String : AnyObject]
            var foodItem = FoodItem(dictionary: foodItemDict)
            foodItems.append(foodItem)
            self.navigationController?.popToRootViewController(animated: true)
        }
    
    private func presentAlert(_ title: String, _ message: String, _ action: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString(action, comment: "Default action"), style: .default, handler: {_ in
            NSLog("The \"\(title)\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
