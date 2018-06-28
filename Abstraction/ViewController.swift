//
//  ViewController.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit
// NestCollection || NestTable
// NestCollectionCell || NestTableCell

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var ds: TableViewNestDataSource! //This works if the object itself is initialized, but NOT when it's initialized in a function.
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ds = TableViewNestDataSource(["Item", "Item1", "Item2", "Item3"])
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width*0.90, height:100*CGFloat(ds.data.count))
        layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        collectionView.collectionViewLayout = layout
        // Abstract this out, or make a super class called UICollectionViewNestParent || UITableViewNestParent
        // UICollectionViewNestParentDataSource
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let setDatasource: (TableViewNestDataSource) -> () = {dataSource in
            guard let collectionViewCell = cell as? DefaultCell else {return}
            collectionViewCell.tableView.dataSource = dataSource
            collectionViewCell.tableView.delegate = dataSource
        }
        setDatasource(ds)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCell", for: indexPath) as? DefaultCell else {return UICollectionViewCell()}
        return cell
    }
    //Need to set height based off number of items in child collectionView/tableView
}

