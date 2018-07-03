//
//  CollectionViewController.swift
//  StickyHeadersApp
//
//  Created by Imanou on 17/04/2018.
//  Copyright © 2018 Imanou Petit. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {

    let array = [["1", "1 2", "1 2 3 4 5 6 7 8", "1 2 3 4 5 6 7 8 9 10 11", "1 2 3"], ["1 2 3 4", "1 2 3 4 5 6"], ["1 2 3 4 5 6 7 8 9 10 11 12 13 14 15", "1 2 3 4", "1 2 3 4 5 6 7", "1 2 3 4 5 6 7 8 9", "1", "1 2 3 4 5"], ["1", "1 2 3 4 5 6"]]

    let columnLayout = FlowLayout(
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Center cells"

        collectionView?.collectionViewLayout = columnLayout
        collectionView?.contentInsetAdjustmentBehavior = .always
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView", for: indexPath) as! HeaderReusableView
        headerView.label.text = "\(indexPath.section)"
        return headerView
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array[section].count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = array[indexPath.section][indexPath.row]
        return cell
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView?.collectionViewLayout.invalidateLayout()
        super.viewWillTransition(to: size, with: coordinator)
    }

}
