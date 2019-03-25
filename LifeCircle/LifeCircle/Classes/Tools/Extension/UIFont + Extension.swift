 

import UIKit

/*
 如果使用 非系统自带的字体 则需要 导入 .ttf 文件
 info.plist中需要配置 Fonts provided by application
                    类型为 String
                    名称为 字体名称
 
    如果有字体多个则为Array，每一个都是 String.
 
 在 Build Phases ->  Copy Bundle Resources  ,一定要添加上，否则无法使用
 
 */

extension UIFont {
    
    /// 查询可用的字体
    ///
    /// - Returns: 字体的family 和 fontName
    static func availableFont() -> [[String: String]]{
        
        var fontDictionary = [
            [String: String]
        ]()
        
        /// 所有的字体族名称
        for family in UIFont.familyNames {
            
            // 每个family下的font名称
            for fontName in UIFont.fontNames(forFamilyName: family) {
                
                fontDictionary.append([family: fontName])
            }
        }
        
        return fontDictionary
    }
}
