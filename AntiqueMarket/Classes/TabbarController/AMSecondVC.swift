//
//  AMSecondVC.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMSecondVC: UIViewController,UIWebViewDelegate {

    let myTxt = UITextField()
    override func viewDidLoad() {
        
        super.viewDidLoad()


        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
