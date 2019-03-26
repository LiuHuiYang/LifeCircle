 
import UIKit
 
 extension UIApplication {
    
    
    /// 页面布局方向
    ///
    /// - Returns: true - 从右到到 false 从右到左
    static func isLeftToRight() -> Bool {
        
        return
            UIApplication.shared.userInterfaceLayoutDirection
                == .leftToRight
    }
    
    /// 获得当前的应用的名称
    ///
    /// - Returns: 应用名称
    static func applicationName() -> String {
        
        guard let appName =
            Bundle.main.infoDictionary?["CFBundleDisplayName"] as? String else {
                
                return Bundle.main.infoDictionary?["CFBundleName"] as? String ?? "CFBundleName"
        }
        
        return appName
    }
    
    
    /// 当前应用版本
    ///
    /// - Returns: 版本信息字符串
    static func applicationVersion() -> String {
        
        return
            Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0"
    }
 }
