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
    var items: [Any] // This should probably change
    var reuseIdentifier: String {
        return "SomeIdentifier"
    }
    
    init(_ items: [String]) {
        self.items = items
    }
    
    func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// So the idea here is to dynamically set the dataSource based on nestType
protocol NestCellProtocol {
    func configureWithDataSource(_ dataSource: NestDataSourceProtocol)
}

class NestCollectionCell: UICollectionViewCell, NestCellProtocol {
    
    // Something like this to set the dataSource
    func configureWithDataSource(_ dataSource: NestDataSourceProtocol) {
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
