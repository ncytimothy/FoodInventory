//
//  StoreTableViewCell.swift
//  FoodInventory
//
//  Created by Timothy Ng on 1/20/18.
//  Copyright © 2018 james luo. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var foodItemLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
