//
//  colors.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

// MARK: - ====== 常用的几个高度值  ======

/// 状态栏高度
let statusHeight: CGFloat = 20

/// tabBar高度
let tabBarHeight: CGFloat = 49

/// 导航栏的高度
let navigationBarHeight: CGFloat = 64

// MARK: ====== 偏好设置的几个Key  ======


/// 当前版本的记录
let currentVersionKey = "currentVersionKey"

// MARK: - ====== 普通模式下的颜色 ======


/// 普通模式的主题背景颜色
let backgroundColorLight =
    UIColor.color(withHex: 0x47a0db)


// MARK: - ====== 黑暗模式下的颜色 ======


/// 黑暗模式的主题背景颜色
let backgroundColorDark =
//        UIColor.color(withHex: 0x383f45)
    //    UIColor.color(withHex: 0x60656a)
    UIColor.color(withHex: 0x202632)


/// 黑暗模式下的普通的主要UI及文字颜色
let mainColorNormalDark = UIColor.color(withHex: 0xf1f1f1)

/// 黑暗模式下的高亮的主要UI及文字颜色
let mainColorHightlightedDark = UIColor.color(withHex: 0x05eeff)

/// 黑暗模式的辅助UI及文字颜色
let auxiliaryColorDark = UIColor.color(withHex: 0xed4949)

/// 黑暗模式的点缀颜色
let ornamentColorDark = UIColor.color(withHex: 0x10e634)


// MARK: - ======  地图的url ======

/// 高德地图
let gaodeMapAddress = "iosamap"

/// 百度地图
let baidumMapAddress = "baidumap"

/// 谷歌地图
let googleMapAddress = "comgooglemaps"

/// 腾讯地图
let qqMapAddress = "qqmap"
