//
//  DataGridViewColumnHeaderCell.swift
//
//  Created by Vladimir Lyukov on 03/08/15.
//

import UIKit


open class DataGridViewColumnHeaderCell: DataGridViewBaseHeaderCell
{
    private static var __once: () = {
        let appearance = DataGridViewColumnHeaderCell.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.sortedBackgroundColor = UIColor(white: 220.0/255.0, alpha: 1)
        appearance.sortAscSuffix = " ↑"
        appearance.sortDescSuffix = " ↓"
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        appearance.borderBottomColor = UIColor(white: 0.73, alpha: 1)
        appearance.borderBottomWidth = 1 / UIScreen.main.scale
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf:[DataGridViewColumnHeaderCell.self])
        
        if #available(iOS 8.2, *)
        {
            labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        }
        else
        {
            labelAppearance.font = UIFont(name: "HelveticaNeue", size: 14)
        }
        labelAppearance.textAlignment = .center
        labelAppearance.adjustsFontSizeToFitWidth = true
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
        
    }()
    // MARK: - UIView
//    open override static func initialize() {
//        super.initialize()
//        _ = DataGridViewColumnHeaderCell.__once
//    }
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        _ = DataGridViewColumnHeaderCell.__once
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = DataGridViewColumnHeaderCell.__once
    }
    
    
    // MARK: - Custom methods
    
    open override func didTap(_ gesture: UITapGestureRecognizer) {
        dataGridView.collectionViewDelegate.collectionView(dataGridView.collectionView, didTapHeaderForColumn: indexPath.index)
    }
}
