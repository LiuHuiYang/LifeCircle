//
//  HYRoomViewController.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

/// 房间部分的重用cell
private let HYRoomCollectionCellReuseIdentifier =
    "HYRoomCollectionCellReuseIdentifier"

class HYRoomViewController: HYViewController {

    
    /// 布局
    private lazy var layout = UICollectionViewFlowLayout()

    /// 房间与设备的显示列表
    private lazy var collectionView: UICollectionView = {
        
        let listView =
            UICollectionView(frame: CGRect.zero,
                             collectionViewLayout: layout
        )
        
        listView.showsVerticalScrollIndicator = false
        listView.showsHorizontalScrollIndicator = false
        listView.backgroundColor = UIColor.clear
        listView.dataSource = self
        listView.delegate = self
        
        return listView
    }()
    
    
}


// MARK: - UICollectionViewDelegate
extension HYRoomViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        printLog(message: "选择位置\(indexPath.item)")
        
        let viewController = HYRoomDetailViewController()
        
        
        navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
}

// MARK: - UICollectionViewDataSource
extension HYRoomViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell =
            collectionView.dequeueReusableCell(
                withReuseIdentifier:
                    HYRoomCollectionCellReuseIdentifier,
                for: indexPath
        )
        
        cell.backgroundColor = UIColor.random()
        
        return cell
    }
    
}

extension HYRoomViewController {
    
    
    /// 选择不同的房子
    @objc func selectHouse() {
        
        printLog(message: "选择房间")
        
        // 获得选择的房间
        
        // 记录最新的选项
        
        // 如果不是相同的房间
        collectionView.reloadData()
    }
}

// MARK: - UI初始化
extension HYRoomViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.leftBarButtonItem =
            UIBarButtonItem(customView:
                UIButton(normalImage: nil,
                         highlightedImage: nil,
                         addTarget: self,
                         action: #selector(selectHouse),
                         for: .touchUpInside) ?? UIButton()
        )
        
        collectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier:
                HYRoomCollectionCellReuseIdentifier
        )
        
        
        view.addSubview(collectionView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let totalCols = 2
        
        let itemWidth =
            (view.width - CGFloat(totalCols + 1) * statusHeight) /
            CGFloat(totalCols)
        
        let itemHeight = itemWidth * 1.2
        
        layout.minimumLineSpacing = statusHeight
        layout.minimumInteritemSpacing = statusHeight
        
        layout.itemSize =
            CGSize(width: itemWidth, height: itemHeight)
        
        collectionView.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.view.snp_top)
            make.leading.equalTo(self.view.snp_leading).offset(15)
            make.trailing.equalTo(self.view.snp_trailing).offset(-15)
            make.bottom.equalTo(self.view.snp_bottom)
        }
    }
}
