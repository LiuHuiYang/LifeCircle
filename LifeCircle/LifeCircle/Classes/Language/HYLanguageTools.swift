//
//  HYLanguageTools.swift
//  LifeCircle
//
//  Created by Apple on 2019/3/26.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

/// 语言工具
struct HYLanguageTools {
    
    
    /// 语言适配文字
    ///
    /// - Parameters:
    ///   - key: 字符串的key
    ///   - comment: 字符串的解释
    /// - Returns: 字符串a
    static func adaptationText(key: String, comment: String) -> String {
        
        return
            NSLocalizedString(key,
                              tableName: "text",
                              bundle: Bundle.main,
                              value: key,
                              comment: comment
        )
    }
}
