//
//  HYNewFeaturesCollectionViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SnapKit

private let reuseIdentifier = "HYNewFeaturesCollectionViewCell"

class HYNewFeaturesCollectionViewController: UICollectionViewController {
    
    /// 状态栏样式
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    /// 引导信息
    private lazy var guideMessages = [
        
        [
            "iconName": "guide_light",
            "color": "0x16d0c6",
            "message": "互联网改变生活"
        ],
        
        [
            "iconName": "guide_airConditioner",
            "color": "0x48e1f8",
            "message": "科技让生活更有趣"
        ],
        
        [
            "iconName": "guide_tv",
            "color": "0x5bb6f5",
            "message": "智能让生活更简单"
        ]
    ]
    
    /// 页面指示
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        
        // 布局方向是双向的
        pageControl.semanticContentAttribute = .spatial
        
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor =
            UIColor.color(withHex: 0x8d9aa5, alpha: 0.8)
//        pageControl.backgroundColor = UIColor.red
        return pageControl
    }()
    
    /// 开启按钮
    private lazy var startButton =
        UIButton(
            title: "开始使用",
            font: UIFont(name: "PingFangSC-Semibold", size: 18),
            normalTitieColor: UIColor.white,
            highlightedTitleColor: UIColor.white,
            addTarget: self,
            action: #selector(chageRootController),
            for: .touchUpInside
    )
    
    /// 指定流水布局
    init() {
        
        let flayout = UICollectionViewFlowLayout()
        
        flayout.minimumLineSpacing = 0
        flayout.minimumInteritemSpacing = 0
        flayout.itemSize = UIScreen.main.bounds.size
        flayout.scrollDirection = .horizontal
        
        super.init(collectionViewLayout: flayout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func chageRootController() {
        
        UIApplication.shared.keyWindow?.rootViewController =
            HYMainViewController()
    }
}



// MARK: - 初始化
extension HYNewFeaturesCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 设置collectionView
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(
            UINib(nibName: reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: reuseIdentifier
        )
        
        // 页面指示器
        pageControl.numberOfPages = guideMessages.count
        view.addSubview(pageControl)
        
        // 开启按钮
        startButton?.isHidden = true
        startButton?.layer.borderWidth = 2
        startButton?.layer.borderColor =
            UIColor.white.cgColor
        startButton?.layer.cornerRadius = statusHeight * 0.5
        startButton?.clipsToBounds = true
        view.addSubview(startButton!)
    }
   
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // 页面指示器的约束
        pageControl.snp.makeConstraints { (make) in
           
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            
            make.height.equalTo(tabBarHeight)
            make.top.equalTo(
                self.collectionView.snp.bottom
            ).multipliedBy(0.7)
        }
        
        // 按钮约束
        startButton!.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
            
            make.height.equalTo(tabBarHeight)
 
            make.top.equalTo(
                self.pageControl.snp.bottom
            ).offset(statusHeight)
        }

    }
}


// MARK: - UICollectionViewDelegate
extension HYNewFeaturesCollectionViewController {
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let page =
            Int((scrollView.contentOffset.x + scrollView.width * 0.5) /
                scrollView.width
        )

        printLog(message: page)
        pageControl.currentPage = page
        
        
        if UIApplication.isLeftToRight() {
            
            startButton?.isHidden =
                page != (guideMessages.count - 1)
        
        } else {
            
            startButton?.isHidden = page != 0
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HYNewFeaturesCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return guideMessages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier: reuseIdentifier,
                for: indexPath
        ) as! HYNewFeaturesCollectionViewCell
        
        cell.guideMessage = guideMessages[indexPath.item]
        
        return cell
    }
}
