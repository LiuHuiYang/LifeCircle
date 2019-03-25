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
            "color": "0x16d0c6"],
        
        [
            "iconName": "guide_airConditioner",
            "color": "0x48e1f8"],
        
        [
            "iconName": "guide_tv",
            "color": "0x5bb6f5"
        ]
    ]
    
    /// 页面指示
    private lazy var pageControl: UIPageControl = {
        
        let pageControl = UIPageControl()
        
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        pageControl.currentPageIndicatorTintColor = UIColor.white
        pageControl.pageIndicatorTintColor =
            UIColor.color(withHex: 0x8d9aa5, alpha: 0.8)
//        pageControl.backgroundColor = UIColor.red
        return pageControl
    }()
    
    
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
    
    
}



// MARK: - 初始化
extension HYNewFeaturesCollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        setupPageControl()
    }
    
    
    /// 设置页面指示
    private func setupPageControl() {
        
        pageControl.numberOfPages = guideMessages.count
        view.addSubview(pageControl)
    }
    
    /// 设置collectionView
    private func setupCollectionView() {
        
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(
            UINib(nibName: reuseIdentifier, bundle: nil),
            forCellWithReuseIdentifier: reuseIdentifier
        )
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
    }
}


// MARK: - UICollectionViewDelegate
extension HYNewFeaturesCollectionViewController {
    
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
       
        let page =
            (scrollView.contentOffset.x + scrollView.width * 0.5) /
                scrollView.width

        pageControl.currentPage = Int(page)
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
