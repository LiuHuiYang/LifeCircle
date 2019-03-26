//
//  HYHomeViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HYHomeViewController: HYViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let vc = HYViewController()
        
        vc.title = "测试"
        
        vc.view.backgroundColor = UIColor.random()
        
        navigationController?.pushViewController(vc, animated:
            true
        )
    }
}


