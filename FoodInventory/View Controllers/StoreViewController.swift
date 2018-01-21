//
//  StoreViewController.swift
//  FoodInventory
//
//  Created by Timothy Ng on 1/20/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit

class StoreViewController: UITableViewController {
    
    let login = "AWP-CLI3R-UFTOIONJM4FW"
    let password = "rzCBkfntSwmIYQ7Q4Ad8Cw"
    
    let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 117.0
        
        createProduct({(success) in DispatchQueue.main.async {
            
            if success {
                self.tableView.reloadData()
            }
        
        }
    })
}

    
        func createProduct(_ completionHandlerForProductCreation: @escaping (_ success: Bool) -> Void) {
            
            let _ = taskForGETMethod("beef", completionHandlerForGET: {(result, error) in
                
                var productName: String? = "productName"
                var price: Double?
                var productImage: UIImage!
                
                if let error = error {
                    print(error)
                    completionHandlerForProductCreation(false)
                } else {
                    if let result = result?["products"] as? [[String:AnyObject]] {
                        for term in result {
                            
                            if let display = term["display"] as? [String:AnyObject] {
                                guard let productDisplayName = display["en"] as? String else {
                                    print("Cannot find key 'display' in '\(term)'")
                                    return
                                }
                                
                                productName = productDisplayName
                                
                            }
                            
                            if let pricing = term["pricing"] as? [String:AnyObject] {
                                if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                    if let usdPrice = priceInPricing["USD"] as? Double {
                                        price = usdPrice
                                        print("price: \(price)")
                                        prices["Beef"] = price
                                    }
                                }
                            }
                            
                            guard let imageURLString = term["image"] as? String else {
                                print("Cannot find key 'image' in '\(term)'")
                                return
                            }
                            
                            let imageURL = URL(string: imageURLString)
                            if let imageData = try? Data(contentsOf: imageURL!) {
                                productImage = UIImage(data: imageData)
                            }
                            
                            let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                            let product = Product(dictionary: productDict)
                            products.append(product)
                            completionHandlerForProductCreation(true)
                        }
                    }
                }
            })
        
            let _ = taskForGETMethod("rice", completionHandlerForGET: {(result, error) in
            
            var productName: String? = "productName"
            var price: Double?
            var productImage: UIImage!
            
            if let error = error {
                print(error)
                completionHandlerForProductCreation(false)
            } else {
                if let result = result?["products"] as? [[String:AnyObject]] {
                    for term in result {
                        
                        if let display = term["display"] as? [String:AnyObject] {
                            guard let productDisplayName = display["en"] as? String else {
                                print("Cannot find key 'display' in '\(term)'")
                                return
                            }
                            
                            productName = productDisplayName
                            
                        }
                        
                        if let pricing = term["pricing"] as? [String:AnyObject] {
                            if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                if let usdPrice = priceInPricing["USD"] as? Double {
                                    price = usdPrice
                                    print("price: \(price)")
                                     prices["Rice"] = price
                                }
                            }
                        }
                        
                        guard let imageURLString = term["image"] as? String else {
                            print("Cannot find key 'image' in '\(term)'")
                            return
                        }
                        
                        let imageURL = URL(string: imageURLString)
                        if let imageData = try? Data(contentsOf: imageURL!) {
                            productImage = UIImage(data: imageData)
                        }
                        
                        let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                        let product = Product(dictionary: productDict)
                        products.append(product)
                        completionHandlerForProductCreation(true)
                    }
                }
            }
        })
            
            let _ = taskForGETMethod("bread", completionHandlerForGET: {(result, error) in
                
                var productName: String? = "productName"
                var price: Double?
                var productImage: UIImage!
                
                if let error = error {
                    print(error)
                    completionHandlerForProductCreation(false)
                } else {
                    if let result = result?["products"] as? [[String:AnyObject]] {
                        for term in result {
                            
                            if let display = term["display"] as? [String:AnyObject] {
                                guard let productDisplayName = display["en"] as? String else {
                                    print("Cannot find key 'display' in '\(term)'")
                                    return
                                }
                                
                                productName = productDisplayName
                                
                            }
                            
                            if let pricing = term["pricing"] as? [String:AnyObject] {
                                if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                    if let usdPrice = priceInPricing["USD"] as? Double {
                                        price = usdPrice
                                        print("price: \(price)")
                                        prices["Bread"] = price
                                    }
                                }
                            }
                            
                            guard let imageURLString = term["image"] as? String else {
                                print("Cannot find key 'image' in '\(term)'")
                                return
                            }
                            
                            let imageURL = URL(string: imageURLString)
                            if let imageData = try? Data(contentsOf: imageURL!) {
                                productImage = UIImage(data: imageData)
                            }
                            
                            let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                            let product = Product(dictionary: productDict)
                            products.append(product)
                            completionHandlerForProductCreation(true)
                        }
                    }
                }
            })
            
            let _ = taskForGETMethod("bananas", completionHandlerForGET: {(result, error) in
                
                var productName: String? = "productName"
                var price: Double?
                var productImage: UIImage!
                
                if let error = error {
                    print(error)
                    completionHandlerForProductCreation(false)
                } else {
                    if let result = result?["products"] as? [[String:AnyObject]] {
                        for term in result {
                            
                            if let display = term["display"] as? [String:AnyObject] {
                                guard let productDisplayName = display["en"] as? String else {
                                    print("Cannot find key 'display' in '\(term)'")
                                    return
                                }
                                
                                productName = productDisplayName
                                
                            }
                            
                            if let pricing = term["pricing"] as? [String:AnyObject] {
                                if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                    if let usdPrice = priceInPricing["USD"] as? Double {
                                        price = usdPrice
                                        print("price: \(price)")
                                        prices["Bananas"] = price
                                    }
                                }
                            }
                            
                            guard let imageURLString = term["image"] as? String else {
                                print("Cannot find key 'image' in '\(term)'")
                                return
                            }
                            
                            let imageURL = URL(string: imageURLString)
                            if let imageData = try? Data(contentsOf: imageURL!) {
                                productImage = UIImage(data: imageData)
                            }
                            
                            let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                            let product = Product(dictionary: productDict)
                            products.append(product)
                            completionHandlerForProductCreation(true)
                        }
                    }
                }
            })
            
            let _ = taskForGETMethod("oranges", completionHandlerForGET: {(result, error) in
                
                var productName: String? = "productName"
                var price: Double?
                var productImage: UIImage!
                
                if let error = error {
                    print(error)
                    completionHandlerForProductCreation(false)
                } else {
                    if let result = result?["products"] as? [[String:AnyObject]] {
                        for term in result {
                            
                            if let display = term["display"] as? [String:AnyObject] {
                                guard let productDisplayName = display["en"] as? String else {
                                    print("Cannot find key 'display' in '\(term)'")
                                    return
                                }
                                
                                productName = productDisplayName
                                
                            }
                            
                            if let pricing = term["pricing"] as? [String:AnyObject] {
                                if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                    if let usdPrice = priceInPricing["USD"] as? Double {
                                        price = usdPrice
                                        print("price: \(price)")
                                        prices["Oranges"] = price
                                    }
                                }
                            }
                            
                            guard let imageURLString = term["image"] as? String else {
                                print("Cannot find key 'image' in '\(term)'")
                                return
                            }
                            
                            let imageURL = URL(string: imageURLString)
                            if let imageData = try? Data(contentsOf: imageURL!) {
                                productImage = UIImage(data: imageData)
                            }
                            
                            let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                            let product = Product(dictionary: productDict)
                            products.append(product)
                            completionHandlerForProductCreation(true)
                        }
                    }
                }
            })
            
            let _ = taskForGETMethod("apples", completionHandlerForGET: {(result, error) in
                
                var productName: String? = "productName"
                var price: Double?
                var productImage: UIImage!
                
                if let error = error {
                    print(error)
                    completionHandlerForProductCreation(false)
                } else {
                    if let result = result?["products"] as? [[String:AnyObject]] {
                        for term in result {
                            
                            if let display = term["display"] as? [String:AnyObject] {
                                guard let productDisplayName = display["en"] as? String else {
                                    print("Cannot find key 'display' in '\(term)'")
                                    return
                                }
                                
                                productName = productDisplayName
                                
                            }
                            
                            if let pricing = term["pricing"] as? [String:AnyObject] {
                                if let priceInPricing = pricing["price"] as? [String:AnyObject] {
                                    if let usdPrice = priceInPricing["USD"] as? Double {
                                        price = usdPrice
                                        print("price: \(price)")
                                        prices["Apples"] = price
                                    }
                                }
                            }
                            
                            guard let imageURLString = term["image"] as? String else {
                                print("Cannot find key 'image' in '\(term)'")
                                return
                            }
                            
                            let imageURL = URL(string: imageURLString)
                            if let imageData = try? Data(contentsOf: imageURL!) {
                                productImage = UIImage(data: imageData)
                            }
                            
                            let productDict: [String:AnyObject] = ["productName": productName as AnyObject, "price": price as AnyObject, "productImage": productImage]
                            let product = Product(dictionary: productDict)
                            products.append(product)
                            completionHandlerForProductCreation(true)
                        }
                    }
                }
            })
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "storeCell") as! StoreTableViewCell
        
        print("products: \(products)")
        
        cell.foodItemLabel.text = products[indexPath.row].productName
        cell.foodImageView.image = products[indexPath.row].productImage
        cell.price.text = "$" + String(describing: products[indexPath.row].price!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let purchaseVC = storyboard?.instantiateViewController(withIdentifier: "purchaseVC") as! PurchaseViewController
        purchaseVC.foodImage = products[indexPath.row].productImage
        purchaseVC.foodName = products[indexPath.row].productName
        purchaseVC.foodPrice = products[indexPath.row].price!

        self.navigationController?.pushViewController(purchaseVC, animated: true)
    }
        
    func taskForGETMethod(_ productQuery: String, completionHandlerForGET: @escaping (_ result: AnyObject?, _ error: NSError?) -> Void) -> URLSessionDataTask {
            
            /* 1. Build the URL and request */
            let url = URL(string: "https://qa-api.fastspring.com/products/\(productQuery)")
            let request = URLRequest(url: url!)
            
            /* 2. Build the URLSessionConfig and encapsulate the user credentials */
            let config = URLSessionConfiguration.default
            let userPasswordString = "\(login):\(password)"
            let userPasswordData = userPasswordString.data(using: .utf8)
            
            /* 3. Set up Base 64 Encoded Credential and add the encoded credential to HTTP header */
            let base64EncodedCredential = userPasswordData!.base64EncodedString(options: .init(rawValue: 0))
            let authString = "Basic \(base64EncodedCredential)"
            config.httpAdditionalHeaders = ["Authorization" : authString]
            
            /* 4. Configure the URLSession and build the task */
            let session = URLSession(configuration: config)
            
            let task = session.dataTask(with: request, completionHandler: {( data, response, error) in
                
                func sendError(_ error: String) {
                    print(error)
                    let userInfo = [NSLocalizedDescriptionKey: error]
                    completionHandlerForGET(nil, NSError(domain: "taskForGETMethod", code: 1, userInfo: userInfo))
                }
                
                /* GUARD: Was there an error? */
                guard (error == nil) else {
                    sendError("There was an error with your request: \(error!)")
                    return
                }
                
                /* GUARD: Did we get a successful 2XX response? */
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                    sendError("There was an error with your request: \(error!)")
                    return
                }
                
                /* GUARD: Was there an error? */
                guard let data = data else {
                    sendError("No data was returned by the request!")
                    return
                }
                
                print(String(data: data, encoding: .utf8)!)
                
                /* 5. Parse the data and use the data (in the completion handler) */
                self.convertDataWithCompletionHandler(data, completionHandlerForConvertData: completionHandlerForGET)
            })
            
            task.resume()
            return task
            
        }
        
        
        
        private func convertDataWithCompletionHandler(_ data: Data, completionHandlerForConvertData: (_ result: AnyObject?, _ error: NSError?) -> Void) {
            
            var parsedResult: AnyObject! = nil
            do {
                parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
            } catch {
                let userInfo = [NSLocalizedDescriptionKey: "Could not parse the data as JSON: '\(data)'"]
                completionHandlerForConvertData(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
            }
            
            completionHandlerForConvertData(parsedResult, nil)
        }
    
    class func sharedInstance() -> StoreViewController {
        struct Singleton {
            static var sharedInstance = StoreViewController()
        }
        return Singleton.sharedInstance
    }
    
}
