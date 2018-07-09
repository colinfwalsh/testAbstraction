//
//  TableViewNestDataSource.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class TableViewNestDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    let data: [Any]!
    
    init(_ data: [Any]) {
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableNest", for: indexPath) as? TableViewNest else {return UITableViewCell()}
        cell.titleLabel.text = "\(self.data[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height/CGFloat(data.count)
    }
}
