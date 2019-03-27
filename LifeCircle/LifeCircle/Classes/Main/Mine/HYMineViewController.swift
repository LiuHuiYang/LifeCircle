//
//  HYMineViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HYMineViewController: HYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 测试语言切换
        
    }
     
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         
        let test = HYSwithLanguageViewController()
        
        navigationController?.pushViewController(test, animated: true)
    }
}


// MARK: - 语言切换
extension HYMineViewController {
    
}
