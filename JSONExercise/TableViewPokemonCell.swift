//
//  TableViewPokemonCell.swift
//  JSONExercise
//
//  Created by Camilo Cabana on 10/5/19.
//  Copyright © 2019 Camilo Cabana. All rights reserved.
//

import UIKit

class TableViewPokemonCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
