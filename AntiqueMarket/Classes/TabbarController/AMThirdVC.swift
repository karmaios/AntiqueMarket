//
//  AMThirdVC.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMThirdVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let btn = UIButton(frame: CGRectMake(50, 100, 80, 20))
        btn.titleLabel?.font  = UIFont.systemFontOfSize(13)
        btn.setTitle("跳一", forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("btnClick"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        let btn2 = UIButton(frame: CGRectMake(50, 200, 80, 20))
        btn2.titleLabel?.font  = UIFont.systemFontOfSize(13)
        btn2.setTitle("跳二", forState: UIControlState.Normal)
        btn2.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn2.addTarget(self, action: Selector("btn2Click"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(btn2)
    }
    
    func btnClick(){
        tabBarController?.selectedIndex = 0
    }
    func btn2Click(){
        tabBarController?.selectedIndex = 1
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
