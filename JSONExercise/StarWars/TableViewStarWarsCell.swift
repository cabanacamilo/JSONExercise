//
//  TableViewStarWarsCell.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 10/4/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class TableViewStarWarsCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
