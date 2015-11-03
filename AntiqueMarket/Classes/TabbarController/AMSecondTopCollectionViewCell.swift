//
//  AMSecondTopCollectionViewCell.swift
//  AntiqueMarket
//
//  Created by super on 15/11/2.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMSecondTopCollectionViewCell: UICollectionViewCell {
    var cellTitleLabel:UILabel?
    var cellIconBtn:UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
        initCellTitleLabelAndIconBtn()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     func  initCellTitleLabelAndIconBtn(){
            // 创建标签
        cellTitleLabel = UILabel()
        cellTitleLabel!.text = "标签"
        cellTitleLabel!.adjustsFontSizeToFitWidth = true
        cellTitleLabel!.textAlignment = NSTextAlignment.Center
        cellTitleLabel!.textColor = .grayColor()
        cellTitleLabel!.font = UIFont.systemFontOfSize(13)
        self.addSubview(cellTitleLabel!)
        cellTitleLabel!.snp_makeConstraints(closure: { (make) -> Void in
            make.center.equalTo(self.snp_center)
            make.width.height.equalTo(CGSizeMake(60, 38))
        })
        
        cellIconBtn = UIButton()
        cellIconBtn?.setBackgroundImage(UIImage(named: "cellIcon_btn"), forState: .Normal)
        cellIconBtn?.setBackgroundImage(UIImage(named: "cellIcon_btn_selected")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Selected)
        self.addSubview(cellIconBtn!)
        cellIconBtn!.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(cellTitleLabel!.snp_bottom).offset(-10)
            make.left.equalTo(cellTitleLabel!.snp_right)
            make.width.height.equalTo(CGSizeMake(6, 6))
        }


    }
    
}
