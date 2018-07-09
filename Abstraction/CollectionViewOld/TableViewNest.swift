//
//  TableViewNest.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class TableViewNest: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel.text = "Test"
    }
}
