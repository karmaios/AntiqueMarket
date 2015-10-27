//
//  AMThirdVC.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMThirdVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        initVCTitleUserPhotoUserNickName()
        let thirdVCTableView = UITableView(frame: CGRectMake(0, 240, Screen_Width, Screen_Height-100), style: UITableViewStyle.Plain)
        thirdVCTableView.delegate = self
        thirdVCTableView.dataSource = self
        thirdVCTableView.backgroundColor = .yellowColor()
        thirdVCTableView.scrollEnabled = true
//        thirdVCTableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
//        thirdVCTableView.separatorInset = UIEdgeInsetsMake(0, Screen_Width, 0, Screen_Width)
        self.view.addSubview(thirdVCTableView)
        
    }
    //MARK: - - 设置页面标题、头像、用户名
    func initVCTitleUserPhotoUserNickName(){
        self.view.backgroundColor = RGBA(0.94, g: 0.94, b: 0.94)
        
        let userCenterTitleLable = UILabel()
        userCenterTitleLable.text = "我的"
        userCenterTitleLable.font = UIFont.italicSystemFontOfSize(18)
        userCenterTitleLable.textAlignment = .Center
        userCenterTitleLable.textColor = RGBA(0.76, g: 0.65, b: 0.36)
        self.view.addSubview(userCenterTitleLable)
        userCenterTitleLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(40)
            make.width.height.equalTo(CGSize(width: Screen_Width, height: 30))
        }
        
        let userPhotoImageView = UIImageView()
        userPhotoImageView.layer.cornerRadius = 50
        userPhotoImageView.layer.masksToBounds = true
        userPhotoImageView.layer.borderWidth = 0.2
        userPhotoImageView.layer.borderColor = UIColor.grayColor().CGColor
        userPhotoImageView.image = UIImage(named: "me_head_icon")
        userPhotoImageView.contentMode = .ScaleToFill
        self.view.addSubview(userPhotoImageView)
        userPhotoImageView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(userCenterTitleLable.snp_bottom).offset(10)
            make.left.equalTo((Screen_Width - 100)/2)
            make.width.height.equalTo(100)
        }
        
        let userNickNameLabel = UILabel()
        userNickNameLabel.font = UIFont.systemFontOfSize(11)
        userNickNameLabel.text = "用户名"
        userNickNameLabel.textColor = .grayColor()
        userNickNameLabel.textAlignment = .Center
        self.view.addSubview(userNickNameLabel)
        userNickNameLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(userPhotoImageView.snp_bottom).offset(10)
            make.width.equalTo(Screen_Width)
            make.width.height.equalTo(CGSize(width: Screen_Width, height: 12))
        }
    }
    //
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 20
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cellID")
//        resetSeparatorInsetForCell(cell)
        return cell
    }
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        if (cell.respondsToSelector(Selector("setSeparatorInset:"))){
            cell.separatorInset = UIEdgeInsetsZero
        }
                if (cell.respondsToSelector(Selector("setLayoutMargins:")))
                {
        cell.layoutMargins = UIEdgeInsetsZero
                }

    }

    func resetSeparatorInsetForCell(cell:UITableViewCell){
        if (cell.respondsToSelector(Selector("setSeparatorInset:"))){
        cell.separatorInset = UIEdgeInsetsMake(0, Screen_Width, 0, Screen_Width)
        }
//        if (cell.respondsToSelector(Selector("setLayoutMargins:")))
//        {
            cell.layoutMargins = UIEdgeInsetsZero
//        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
