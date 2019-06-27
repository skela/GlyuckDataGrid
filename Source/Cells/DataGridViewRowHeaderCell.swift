//
//  DataGridViewRowHeaderCell.swift
//  Pods
//
//  Created by Vladimir Lyukov on 20/11/15.
//
//

import UIKit


open class DataGridViewRowHeaderCell: DataGridViewBaseHeaderCell {
    private static var __once: () = {
        let appearance = DataGridViewRowHeaderCell.appearance()
        appearance.backgroundColor = UIColor.white
        appearance.sortedBackgroundColor = UIColor(white: 220.0/255.0, alpha: 1)
        appearance.sortAscSuffix = " →"
        appearance.sortDescSuffix = " ←"
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        appearance.borderRightColor = UIColor(white: 0.73, alpha: 1)
        appearance.borderRightWidth = 1 / UIScreen.main.scale
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf:[DataGridViewRowHeaderCell.self])
        if #available(iOS 8.2, *)
        {
            labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        }
        else
        {
            labelAppearance.font = UIFont(name: "HelveticaNeue", size: 14)
        }
        labelAppearance.adjustsFontSizeToFitWidth = true
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
        
    }()
    
//    open override static func initialize() {
//        super.initialize()
//        _ = DataGridViewRowHeaderCell.__once
//    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        _ = DataGridViewRowHeaderCell.__once
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = DataGridViewRowHeaderCell.__once
    }
}
