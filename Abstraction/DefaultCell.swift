//
//  DefaultCell.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class DefaultCell: UICollectionViewCell {
    // Should I bind viewModel here as well?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.reloadData()
        }
    }
    // Essentially viewDidLoad
    override func layoutSubviews() {
        super.layoutSubviews()
        // Sets the look of the collectionView cell
        self.contentView.layer.cornerRadius = 4.0
        self.contentView.layer.backgroundColor = UIColor.gray.cgColor
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
}
