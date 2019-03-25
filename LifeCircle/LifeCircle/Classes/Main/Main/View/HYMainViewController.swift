//
//  HYMainViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HYMainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupChildControllers()
        
        printLog(message: UIApplication.applicationName())
        printLog(message: UIApplication.applicationVersion())
    }
    
}


// MARK: - 设置子控制器
extension HYMainViewController {
    
    /// 设置所有的子控制器
    private func setupChildControllers() {
        
        // 主要的控制器字典数组
        let controllerDictonaryArray = [
            
            ["className" : "HYHomeViewController",
             "title": "Home",
             "imageName": "tabbar_home"
            ],
            
            ["className" : "HYRoomViewController",
             "title": "Room",
             "imageName": "tabbar_room"
            ],
            
            ["className" : "HYSceneViewController",
             "title": "Scene",
             "imageName": "tabbar_scene"
            ],
            
            ["className" : "HYMineViewController",
             "title": "Mine",
             "imageName": "tabbar_mine"
            ],
        ]
        
        var childControllers = [UIViewController]()
        
        for dictionary in controllerDictonaryArray {
            
            childControllers.append(setupController(dictionary))
        }
        
        viewControllers = childControllers
    }
    
    
    
    
    /// 设置子控制器
    ///
    /// - Parameter dictionary: 参数信息
    /// - Returns: 控制器
    private func setupController(_ dictionary: [String: String] ) -> UIViewController {
        
        guard let className = dictionary["className"],
            let title = dictionary["title"],
            let imageName = dictionary["imageName"],
            let controllerClass = NSClassFromString(Bundle.namespace + "." + className) as? UIViewController.Type
            else {
                
                return UIViewController()
        }
        
        let viewController = controllerClass.init()
        
        viewController.title = title
        
        viewController.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                UIColor.white,
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13.0)],
            for: .normal
        )

        viewController.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                UIColor.orange],
            for: .selected
        )
        
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage =
            UIImage(named: imageName +
                "_highlighted")?.withRenderingMode(.alwaysOriginal)
        
        let navigationViewController =
            HYNavigationController(rootViewController: viewController)
        
        return navigationViewController
        
    }
}
