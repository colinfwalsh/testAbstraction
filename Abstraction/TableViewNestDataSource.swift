//
//  TableViewNestDataSource.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit

class TableViewNestDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tableNest", for: indexPath) as? TableViewNest else {return UITableViewCell()}
        cell.titleLabel.text = "Blah"
        return cell
    }
}
