//
//  DataGridViewContentCell.swift
//
//  Created by Vladimir Lyukov on 03/08/15.
//

import UIKit


/**
 Class for default data grid view cell.
 */
open class DataGridViewContentCell: DataGridViewBaseCell {
    private static var __once: () = {
        let appearance = DataGridViewContentCell.appearance()
        appearance.textLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        
        let labelAppearance = UILabel.appearance(whenContainedInInstancesOf:[DataGridViewContentCell.self])
        
        if #available(iOS 8.2, *)
        {
            labelAppearance.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        }
        else
        {
            labelAppearance.font = UIFont(name: "HelveticaNeue-Light", size: 14)
        }
        labelAppearance.minimumScaleFactor = 0.5
        labelAppearance.numberOfLines = 0
        
    }()
//    open override static func initialize() {
//        super.initialize()
//        _ = DataGridViewContentCell.__once
//    }
    
    public override init(frame: CGRect) {
        super.init(frame:frame)
        _ = DataGridViewContentCell.__once
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _ = DataGridViewContentCell.__once
    }
}
