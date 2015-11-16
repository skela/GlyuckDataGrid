//
//  CollectionViewDataSource.swift
//  Pods
//
//  Created by Vladimir Lyukov on 30/07/15.
//
//

import UIKit

public class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    public weak var dataGridView: DataGridView!

    public init(dataGridView: DataGridView) {
        self.dataGridView = dataGridView
        super.init()
    }

    // MARK: - UICollectionViewDataSource

    public func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if let numberOfRows = dataGridView?.dataSource?.numberOfRowsInDataGridView(dataGridView) {
            return numberOfRows
        }
        return 0
    }

    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataGridView.dataSource?.numberOfColumnsInDataGridView(dataGridView) ?? 0
    }

    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let dataGridDataSource = dataGridView.dataSource else {
            fatalError("dataGridView.dataSource unexpectedly nil")
        }
        if let cell = dataGridDataSource.dataGridView?(dataGridView, cellForItemAtIndexPath: indexPath) {
            return cell
        } else {
            let cell = dataGridView.dequeueReusableCellWithReuseIdentifier(DataGridView.ReuseIdentifiers.defaultCell, forIndexPath: indexPath) as! DataGridViewContentCell
            cell.textLabel.text = dataGridDataSource.dataGridView?(dataGridView, textForCellAtIndexPath: indexPath) ?? ""
            if indexPath.dataGridRow % 2 == 0 {
                cell.backgroundColor = dataGridView.row1BackgroundColor
            } else {
                cell.backgroundColor = dataGridView.row2BackgroundColor
            }
            dataGridDataSource.dataGridView?(dataGridView, configureContentCell: cell, atIndexPath: indexPath)
            return cell
        }
    }

    public func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        guard let dataGridDataSource = dataGridView.dataSource else {
            fatalError("dataGridView.dataSource unexpectedly nil")
        }
        let column = indexPath.row
        let cell = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: DataGridView.ReuseIdentifiers.defaultHeader, forIndexPath: indexPath) as! DataGridViewHeaderCell
        cell.configureForDataGridView(dataGridView, indexPath: indexPath)
        var text = dataGridDataSource.dataGridView(dataGridView, titleForHeaderForColumn: column)
        if dataGridView.sortColumn == column {
            text += dataGridView.sortAscending ? " ↑" : " ↓"
            cell.isSorted = true
        } else {
            cell.isSorted = false
        }
        cell.textLabel.text = text
        dataGridDataSource.dataGridView?(dataGridView, configureHeaderCell: cell, atColumn: column)
        return cell
    }
}
