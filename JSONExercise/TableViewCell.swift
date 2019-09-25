//
//  TableViewCell.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 9/25/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var userInfo: UILabel!
    @IBOutlet weak var userData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
