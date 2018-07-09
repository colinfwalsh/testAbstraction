//
//  NestCollection.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/28/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import Foundation
import UIKit



protocol NestModelProtocol {
}

protocol NestCompatable {
    var reuseIdentifier: String {get}
    var items: [Any] {get set}
    var childDataSource: NestDataSourceProtocol? {get set}
}

protocol NestTableCompatable: NestCompatable {
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell
}

protocol NestCollectionCompatable: NestCompatable {
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath) -> UICollectionViewCell
}

enum NestType {
    case table
    case collection
    case none
}

// should create tableView or collectionView based on children
protocol NestDataSourceProtocol {
    var items: [NestCompatable] {get set}
    var nestType: NestType {get set}
}

// Broad model protocol?  Or is this good enough?  For instance, the datasource should probably be set here, and ignored later on
// at the NestCollectionCell
class TestModel: NestTableCompatable {
    var childDataSource: NestDataSourceProtocol?
    var items: [Any] // This should probably change
    var reuseIdentifier: String {
        return "TestIdentifier"
    }
    
    init(_ items: [String], childDataSource: NestDataSourceProtocol?) {
        self.items = items
        self.childDataSource = childDataSource
    }
    
    // Something like this
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
            tableView.dequeueReusableCell(
                withIdentifier: reuseIdentifier) as? NestTableCell
            else {return UITableViewCell()}
        if let childDataSource = childDataSource {
            cell.configureWithDataSource(childDataSource)
        }
        return cell
    }
}

// So the idea here is to dynamically set the dataSource based on nestType
protocol NestCellProtocol {
    var scrollView: UIScrollView? {get set}
    func configureWithDataSource(_ dataSource: NestDataSourceProtocol)
}

extension NestCellProtocol {
    func configureWithDataSource(_ dataSource: NestDataSourceProtocol) {
        switch dataSource.nestType {
        case .table:
            print("It's a table view")
            let dataSource = dataSource as? UITableViewDataSource
            (scrollView as? UITableView)?.dataSource = dataSource
        case .collection:
            let dataSource = dataSource as? UICollectionViewDataSource
            (scrollView as? UICollectionView)?.dataSource = dataSource
        default:
            fatalError("Incorrectly set datasource, make sure everything is correct")
        }
    }
}
class NestTableCell: UITableViewCell, NestCellProtocol {
    var scrollView: UIScrollView?
}
/*
class NestCollectionCell: UICollectionViewCell, NestCellProtocol {
    
    // Something like this to set the dataSource
    func configureWithDataSource(_ dataSource: NestDataSourceProtocol, items: [Any]) {
        switch dataSource.nestType {
        case .table:
            print("It's a table view")
        //ie self.tableView.dataSource = dataSource
        case .collection:
            print("It's a collection view")
        //ie self.collectionView.dataSource = dataSource
        default:
            fatalError("Incorrectly set datasource, make sure everything is correct")
        }
    }
}
*/
class NestCollectionSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        /*
         let nestCell = NestCollectionCell(["item"], nestType: .collection)
         return nestCell!
         */
        return UICollectionViewCell()
    }
}

class NestCollection: UICollectionView {
    
}
