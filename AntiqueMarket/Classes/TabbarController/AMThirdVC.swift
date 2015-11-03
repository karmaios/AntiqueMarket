//
//  AMThirdVC.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMThirdVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var listArray:NSArray?
    let cellReuseIdentifier = "userCenterCellReuseIdentifier"
    var  thirdVCTableView:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()

        initVCTitleUserPhotoUserNickName()
        initUserCenterTableView()
        
    }
    //MARK: - - 设置页面标题、头像、用户名
    func initVCTitleUserPhotoUserNickName(){
        self.view.backgroundColor = RGBA(0.94, g: 0.94, b: 0.94)
        // 界面标题
        let userCenterTitleLable = UILabel()
        userCenterTitleLable.text = "我的"
        userCenterTitleLable.adjustsFontSizeToFitWidth = true
        userCenterTitleLable.textAlignment = .Center
        userCenterTitleLable.textColor = RGBA(0.62, g: 0.53, b: 0.22)
        self.view.addSubview(userCenterTitleLable)
        userCenterTitleLable.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(27)
            make.left.equalTo(Screen_Width/2 - 40)
            make.width.height.equalTo(CGSize(width: 80, height: 30))
        }
        // 用户头像
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
        // 用户昵称
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
    //MARK: - - 设置tableview
    func initUserCenterTableView(){
        listArray = [[["me_icon_1","me_icon_6"],["me_icon_4","me_icon_3"],["me_icon_2","me_icon_5"]],[["提现账户","我的买单"],["素材管理","微信分享"],["使用帮助","关于我们"]]]
        thirdVCTableView = UITableView(frame: CGRectMake(0, 210, Screen_Width,Screen_Height - 210 - 49), style: .Plain)
        thirdVCTableView!.delegate = self
        thirdVCTableView!.dataSource = self
        thirdVCTableView!.separatorStyle = .None
        self.view.addSubview(thirdVCTableView!)
    }
    //MARK: - - Section个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    //MARK: - - 每个Section包含Cell个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    //MARK: - - 每个Section的Header高度
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    //MARK: - - 每个Section的Header颜色
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor  = RGBA(0.94, g: 0.94, b: 0.94)
    }
    //MARK: - - 每个Cell高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    //MARK: - - 设置Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:AMThirdVCTableViewCell?
         cell = AMThirdVCTableViewCell(style: .Default, reuseIdentifier: cellReuseIdentifier)
        if cell == nil{
             cell = (tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)) as? AMThirdVCTableViewCell
        }
            cell?.customCellView?.iconLeftImageView?.image = UIImage(named: "\(listArray![0][indexPath.section][indexPath.row])")
            cell!.customCellView?.titleMiddleLabel?.text = "\(listArray![1][indexPath.section][indexPath.row])"
         return cell!
    }
    //MARK: - - cell选中事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch(indexPath.section)
        {
        case 0:
            switch (indexPath.row){
               case 0:
                print("提现账户")
                case 1:
                print("我的买单")
            default:
                break
            }
           
        case 1:
            switch (indexPath.row){
            case 0:
                print("素材管理")
            case 1:
                share()
                print("微信分享")
            default:
                break
            }
        case 2:
            switch (indexPath.row){
            case 0:
                print("使用帮助")
            case 1:
                let vc = AMAboutUSVC()
                self.navigationController?.pushViewController(vc, animated: false)
            default:
                break
            }
        default:
            break
        }
    }

    func share(){
        // 1.创建分享参数
        let shareParames = NSMutableDictionary()
        
        shareParames.SSDKSetupShareParamsByText("This is my First App.",
            images : UIImage(named: "114.png"),
            url : NSURL(string:"http://mob.com"),
            title : "Hello",
            type : SSDKContentType.Text)
        
        //2.进行分享
        ShareSDK.share(SSDKPlatformType.TypeWechat, parameters: shareParames) { (state : SSDKResponseState, userData : [NSObject : AnyObject]!, contentEntity :SSDKContentEntity!, error : NSError!) -> Void in
            self.thirdVCTableView?.reloadData()

            switch state{
                
            case SSDKResponseState.Success:
                print("分享成功")
                let alert = UIAlertView(title: "分享成功", message: "分享成功", delegate: self, cancelButtonTitle: "取消")
                alert.show()
            case SSDKResponseState.Fail:    print("分享失败,错误描述:\(error)")

            case SSDKResponseState.Cancel:  print("分享取消")
            default:
                break
            }
        }

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
