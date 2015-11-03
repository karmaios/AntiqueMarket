//
//  AMAboutUSVC.swift
//  AntiqueMarket
//
//  Created by super on 15/11/2.
//  Copyright © 2015年 super. All rights reserved.
//

import UIKit

class AMAboutUSVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var array = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...100{
            array.addObject(i)
        }
        
        let thirdVCTableView = UITableView(frame: CGRectMake(0, 210, Screen_Width,Screen_Height - 210 - 49), style: .Plain)
        thirdVCTableView.delegate = self
        thirdVCTableView.dataSource = self
        thirdVCTableView.separatorStyle = .None
        self.view.addSubview(thirdVCTableView)
        
    }
    
    //MARK: - - Section个数
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    //MARK: - - 每个Section包含Cell个数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
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
            let cellAID = "ssss"
            cell = tableView.dequeueReusableCellWithIdentifier(cellAID) as? AMThirdVCTableViewCell
            if cell == nil{
                
                //？？？
                cell = AMThirdVCTableViewCell(style: .Default, reuseIdentifier: cellAID)
            }

       return cell!
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
