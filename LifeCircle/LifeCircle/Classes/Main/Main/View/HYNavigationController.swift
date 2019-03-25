//
//  HYNavigationController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HYNavigationController: UINavigationController {
    
    
    /// 状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.titleTextAttributes = [
            
            NSAttributedString.Key.foregroundColor: mainColorNormalDark as Any,
            NSAttributedString.Key.font:
                UIFont(name: "PingFangSC-Semibold", size: 20) as Any
        ]
       
        // 去除分隔线
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }

}


// MARK: - 设置返回样式
extension HYNavigationController {
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            // 隐藏tabBar
            viewController.hidesBottomBarWhenPushed = true
            
            let button =
                UIButton(normalImage: UIImage(named: "back_navigationBar"),
                         highlightedImage: UIImage(named: "back_navigationBar"),
                         addTarget: self,
                         action: #selector(popback),
                         for: .touchUpInside
                    ) ?? UIButton()
            
            // 设置返回样式
            viewController.navigationItem.leftBarButtonItem =
                UIBarButtonItem(customView: button)
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    
    /// 出栈
    @objc private func popback() {
        
        _ = popViewController(animated: true)
    }
}
