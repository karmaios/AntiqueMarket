//
//  AMThirdVCTableViewCell.swift
//  AntiqueMarket
//
//  Created by super on 15/10/28.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMThirdVCTableViewCell: UITableViewCell {
    var customCellView:CustomImageLabelBtnGroupView?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.selectionStyle = .None
        setCell()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(){
         customCellView = CustomImageLabelBtnGroupView(frame: CGRectMake(0,0,320,44))
        self.addSubview(customCellView!)
    }

     override func drawRect(rect: CGRect) {
        // 画下分割线
        let contextUpRef:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetFillColorWithColor(contextUpRef, UIColor.clearColor().CGColor)
        CGContextSetStrokeColorWithColor(contextUpRef, RGBA(0.94, g: 0.94, b: 0.94).CGColor)
        CGContextStrokeRect(contextUpRef, CGRectMake(0, 44, Screen_Width , 0.2))
   }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
