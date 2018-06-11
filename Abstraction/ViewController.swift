//
//  ViewController.swift
//  Abstraction
//
//  Created by Colin Walsh on 6/11/18.
//  Copyright © 2018 Colin Walsh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width*0.90, height:100)
        layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dataSource = TableViewNestDataSource()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "defaultCell", for: indexPath) as? DefaultCell else {return UICollectionViewCell()}
        cell.tableView.dataSource = dataSource
        
        return cell
    }
}

