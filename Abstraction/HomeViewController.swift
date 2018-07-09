//
//  HomeViewController.swift
//  Abstraction
//
//  Created by Colin Walsh on 7/9/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let testArray1 = [["apple", "pear", "danish", "pizza"], ["math", "english", "gym", "orchestra"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .gray
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return testArray1.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray1[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        // Set dynamically based on cell type
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as? TestTableViewCell else {
            return UITableViewCell()
        }
        
        
        
        cell.title.text = testArray1[indexPath.section][indexPath.row]
        
        switch indexPath.row {
        case 0:
            cell.corner = SetCorners.top
        case self.tableView(tableView, numberOfRowsInSection: indexPath.section) - 1:
            cell.corner = SetCorners.bottom
        default:
            cell.corner = .none
            
        }

        return cell
    }
}
