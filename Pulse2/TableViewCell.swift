//
//  TableViewCell.swift
//  MVC
//
//  Created by Mark Moeykens on 5/2/17.
//  Copyright © 2017 Moeykens. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var data1Label: UILabel!
    @IBOutlet weak var data2Label: UILabel!

    func setup(model: Model) {
        titleLabel.text = model.title
        data1Label.text = model.data1
        data2Label.text = model.data2
    }
    
 
}
