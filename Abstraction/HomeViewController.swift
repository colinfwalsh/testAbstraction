//
//  HomeViewController.swift
//  Abstraction
//
//  Created by Colin Walsh on 7/9/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    let testarray = [["apple", "pear", "danish", "pizza"], ["banana", "apple", "pear", "danish"], ["pizza", "banana", "apple", "pear"], ["danisvar", "pizza", "banana"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return testarray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return testarray[section].count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath) as! TestTableViewCell
        cell.title.text = testarray[indexPath.section][indexPath.row]
        
        if testarray[indexPath.section][indexPath.row] == testarray[indexPath.section].first {
            cell.corner = SetCorners.top
        }
        if testarray[indexPath.section][indexPath.row] == testarray[indexPath.section].last! {
            print("Now I'm in here")
            cell.corner = SetCorners.bottom
        }

        return cell
    }
}
