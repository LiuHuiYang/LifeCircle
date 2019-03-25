//
//  HYNewFeaturesCollectionViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

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
            "iconName": "guide_airConditione",
            "color": "0x48e1f8"],
        
        [
            "iconName": "guide_tv",
            "color": "0x5bb6f5"
        ]
    ]
    
    /// 页面指示
    private var pageControl: UIPageControl = UIPageControl()
    
 
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
        
        setupPageController()
    }
    
    
    
    /// 设置页面指示
    private func setupPageController() {
        
        pageControl.backgroundColor = UIColor.red
        pageControl.tintColor = UIColor.white
        pageControl.numberOfPages = guideMessages.count
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = true
        
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
