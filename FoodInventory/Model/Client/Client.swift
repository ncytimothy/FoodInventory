//
//  Client.swift
//  
//
//  Created by Timothy Ng on 1/20/18.
//

import Foundation
import Firebase

class Client: NSObject {
    
    func updateDatabase(completionHandler: @escaping (_ success: Bool, _ userItem: [FoodItem], _ errorString: String?) -> Void) {
        let ref = Database.database().reference()
        ref.child("UserData").child("TestUser").observeSingleEvent(of: .value, with: {snapShot in
            // Get user value
            let value = snapShot.value as? NSDictionary
            let userInfo = value?["UserName"] as? String ?? ""
        })
        ref.child("UserData").child("TestUser").child("food").observe(.value) { snapshot in
            
                if let results = snapshot.value as? [[String:AnyObject]] {
                    let allFood = FoodItem.foodItemsFromResults(results)
                    foodItems = allFood
                    completionHandler(true, allFood, nil)
                }
            
        }
    }
    
    
    class func sharedInstance() -> Client {
        struct Singleton {
            static var sharedInstance = Client()
        }
        return Singleton.sharedInstance
    }
    
    
}


