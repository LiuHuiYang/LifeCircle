//
//  HYNewFeaturesCollectionViewCell.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/25.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HYNewFeaturesCollectionViewCell: UICollectionViewCell {
    
    /// 引导信息
    var guideMessage: [String: String]? {
        
        didSet {
            
            if let msg = guideMessage {
                
                // 设置颜色
                self.backgroundColor =
                    UIColor.color(
                        withString: msg["color"] ?? "#ffffff"
                )
                
                // 设置图片
                iconView.image =
                    UIImage(named: msg["iconName"] ?? "")
                
                // 提示文字
                messageLaebl.text =
                    HYLanguageTools.adaptationText(
                        key: msg["message"]!,
                        comment: "引导页的三个提示文字"
                )
            }
        }
    }
    
    /// 图片
    @IBOutlet weak var iconView: UIImageView!
    
    
    /// 提示文字
    @IBOutlet weak var messageLaebl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
         
    }

}
