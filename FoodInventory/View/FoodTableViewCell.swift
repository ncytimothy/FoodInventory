//
//  FoodTableViewCell.swift
//  InventoryCounter
//
//  Created by Timothy Ng on 1/19/18.
//  Copyright © 2018 Timothy Ng. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var alertTriangle: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
