//
//  CustomImageLabelBtnGroupView.swift
//  AntiqueMarket
//
//  Created by super on 15/10/29.
//  Copyright © 2015年 super. All rights reserved.
//
// 封装的 图标-标签-按钮 view
import UIKit

class CustomImageLabelBtnGroupView: UIView {
    var iconLeftImageView:UIImageView? // 左面图标
    var titleMiddleLabel:UILabel?      // 中间标题
    var iconRigthBtn:UIButton?         //  右边按钮

    override init(frame: CGRect) {
        super.init(frame: frame)
        initImageViewLabelBtn()
    
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 设置图标-标签-按钮
    func initImageViewLabelBtn(){
        iconLeftImageView = UIImageView()
        iconLeftImageView?.image = UIImage(named: "114")
        self.addSubview(iconLeftImageView!)
        iconLeftImageView?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(11)
            make.left.equalTo(22)
            make.width.height.equalTo(16)
        })
        
        titleMiddleLabel = UILabel()
        titleMiddleLabel?.textAlignment = .Center
        titleMiddleLabel?.adjustsFontSizeToFitWidth = true // 字体大小自动适应宽度
        titleMiddleLabel?.textColor = RGBA(0.23, g: 0.22, b: 0.22)
        self.addSubview(titleMiddleLabel!)
        titleMiddleLabel?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(13)
            make.left.equalTo((iconLeftImageView?.snp_right)!).offset(10)
            make.width.height.equalTo(CGSizeMake(60, 14))
        })
        
        iconRigthBtn = UIButton()
        iconRigthBtn?.setImage(UIImage(named: "next_vc_icon_btn"), forState: .Normal)
        self.addSubview(iconRigthBtn!)
        iconRigthBtn?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(13)
            make.right.equalTo(self.snp_right).offset(-25)
            make.width.height.equalTo(CGSizeMake(8, 17))
        })
        
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
