//
//  AMSecondVC.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMSecondVC: UIViewController,UIWebViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate {
    let topCollectionViewCellIdentifier = "topCollectionViewCellID"
    var topCollectionView:UICollectionView?
    let name = ["排序","帅选","搜索"]
    var selectedBtn = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       initTopviewAndTopCollectionview()
        
    }
    func initTopviewAndTopCollectionview(){
        // 顶部背景图
        let topBgView = UIView(frame: CGRectMake(0,0,Screen_Width,64))
        topBgView.backgroundColor = .whiteColor()
        topBgView.userInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action: Selector("btnClick"))
        topBgView.addGestureRecognizer(singleTap)
        self.view.addSubview(topBgView)
        topBgView.addLineWithType(.Default, color: RGBA(0.86, g: 0.86, b: 0.86), position: .Bottom)
        // 标题
        let secondVCTitleLabel = UILabel()
        secondVCTitleLabel.text = "艺市"
        secondVCTitleLabel.textColor = RGBA(0.62, g: 0.53, b: 0.22)
        secondVCTitleLabel.adjustsFontSizeToFitWidth = true
        secondVCTitleLabel.textAlignment = NSTextAlignment.Center
        topBgView.addSubview(secondVCTitleLabel)
        secondVCTitleLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(topBgView.snp_centerX)
            make.centerY.equalTo(topBgView.snp_centerY).offset(10)
            make.width.height.equalTo(CGSizeMake(80, 30))
            }
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.minimumInteritemSpacing   =  0
        flowLayout.minimumLineSpacing = 0
        self.topCollectionView = UICollectionView(frame: CGRectMake(0, 64, Screen_Width, 40), collectionViewLayout: flowLayout)
        self.topCollectionView?.tag =  111
        self.topCollectionView?.dataSource = self
        self.topCollectionView?.delegate   = self
        self.topCollectionView?.showsVerticalScrollIndicator = false
        self.topCollectionView?.showsHorizontalScrollIndicator = false
        self.topCollectionView?.backgroundColor = .whiteColor()
        self.topCollectionView?.registerClass(AMSecondTopCollectionViewCell.self, forCellWithReuseIdentifier: topCollectionViewCellIdentifier)
        self.view.addSubview(topCollectionView!)
        self.topCollectionView?.addLineWithType(.Default, color: RGBA(0.86, g: 0.86, b: 0.86), position: .Bottom)
    
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(topCollectionViewCellIdentifier, forIndexPath: indexPath) as? AMSecondTopCollectionViewCell
        cell!.cellTitleLabel?.text = "\(name[indexPath.row])"
        if indexPath.row == selectedBtn {
            cell?.cellTitleLabel?.textColor =  RGBA(0.62, g: 0.55, b: 0.22)
            cell?.cellIconBtn?.selected  = true
        }else{
            cell?.cellTitleLabel?.textColor =  .grayColor()
            cell?.cellIconBtn?.selected  = false
        }
        return cell!
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        return CGSizeMake(Screen_Width/3, 40)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let defaultIndex = NSIndexPath(forItem: selectedBtn, inSection: 0)
        let defaultCell = collectionView.cellForItemAtIndexPath(defaultIndex) as? AMSecondTopCollectionViewCell
        defaultCell?.cellTitleLabel?.textColor = .grayColor()
        defaultCell?.cellIconBtn?.selected = false
        
        let currentSelectedCell = collectionView.cellForItemAtIndexPath(indexPath) as? AMSecondTopCollectionViewCell
        currentSelectedCell?.cellTitleLabel?.textColor = RGBA(0.62, g: 0.55, b: 0.22)
        currentSelectedCell?.cellIconBtn?.selected = true
    }
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as? AMSecondTopCollectionViewCell
        cell?.cellTitleLabel?.textColor = .grayColor()
        cell?.cellIconBtn?.selected = false
    }
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    private func initSomeBtn(){
        let btn = UIButton(frame: CGRectMake(50, 100, 80, 20))
        btn.titleLabel?.font  = UIFont.systemFontOfSize(13)
        btn.setTitle("跳首页", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("btnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        btn.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        let btn2 = UIButton(frame: CGRectMake(50, 200, 80, 20))
        btn2.titleLabel?.font  = UIFont.systemFontOfSize(13)
        btn2.setTitle("跳我的", forState: UIControlState.Normal)
        btn2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn2.addTarget(self, action: Selector("btn2Click"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn2)
    }
    func btnClick(){
        tabBarController?.selectedIndex = 0
    }
    func btn2Click(){
        tabBarController?.selectedIndex = 2
    }
    func initSomeWeb(){
        let gifWeb:UIWebView = UIWebView(frame: CGRectMake(0,0,Screen_Width,200))
        gifWeb.loadRequest(NSURLRequest(URL: NSURL(string: "http://img4.imgtn.bdimg.com/it/u=2634110199,3755282201&fm=21&gp=0.jpg")!))
        gifWeb.delegate = self
        self.view.addSubview(gifWeb)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {

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
