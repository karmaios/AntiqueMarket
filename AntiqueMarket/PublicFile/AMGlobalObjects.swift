//
//  AMGlobalObjects.swift
//  AntiqueMarket
//
//  Created by super on 15/10/26.
//  Copyright © 2015年 super. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
/*
判断版本号？不知道是否可以使用...
*/

func IS_IOS7() ->Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0 }
func IS_IOS8() -> Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0 }
func IS_IOS9() -> Bool { return (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 9.0 }
//let IS_IOS7 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 7.0
//let IS_IOS8 = (UIDevice.currentDevice().systemVersion as NSString).doubleValue >= 8.0

/*
屏幕宽度 高度
*/
let Screen_Width = UIScreen.mainScreen().bounds.size.width
let Screen_Height = UIScreen.mainScreen().bounds.size.height
/*
比例 默认是iphone6的屏幕
*/
let Screen_Width_Pro = Screen_Width / 375
let Screen_Height_Pro = Screen_Height / 667

// MARK: -  方法作用提示
// TODO: - 未实现的功能(需要实现)
// FIXME: - 修改BUG提示

/*
颜色设置
*/
func RGBA (r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor (red: r, green: g, blue: b, alpha: 1)
}
/*
颜色设置 255
*/
func RGBA_255 (r:CGFloat,g:CGFloat,b:CGFloat) ->UIColor{
    return UIColor (red: r/255, green: g/255, blue: b/255, alpha: 1)
}
// 扩展Button
extension UIButton{
    convenience init(color:UIColor) {
         self.init()
        self.backgroundColor = color
    }
}