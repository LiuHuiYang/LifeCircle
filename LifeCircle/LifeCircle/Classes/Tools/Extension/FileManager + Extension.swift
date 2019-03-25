 

import Foundation

 
// MARK: - 目录下的操作
extension FileManager {
    

    /// 删除目录下的所有内容 (不包含隐藏文件 .DS, 也不含有子目录)
    ///
    /// - Parameter directory: 目录位置, 不能是文件
    static func removeDirectory(_ directory: String) -> Void {
        
        /// 是否为一个路径
        var isDirectory: ObjCBool = false
        
        /// 是否是一个文件夹
        let isExist =
            FileManager.default.fileExists(
                atPath: directory,
                isDirectory: &isDirectory
        )
        
        
        if isDirectory.boolValue == false || isExist == false {
            
            
            let exception =
                NSException(
                    name: NSExceptionName(rawValue: "路径参数错误"),
                    reason: "参数必须是一个已【存在】的【文件夹】夹路径",
                    userInfo: nil
            )
            
            exception.raise()
        }
        
        guard let subDirectory = try?
            FileManager.default.contentsOfDirectory(
                atPath: directory
            ) else {
                
                return
        }
        
        for path in subDirectory {
            
            let filePath = directory + "/" + path
            
            _ = try? FileManager.default.removeItem(atPath: filePath)
        }
        
    }
    
    /// 获得文件大小的字符串表示
    ///
    /// - Parameter size: 文件大小 单位: Byte
    /// - Returns: 大小的字符串表示
    static func fileSizeToString(_ size: UInt) -> String {
        
        var fileSize = ""
        
        let multiple = 1024
        
        if size > multiple * multiple {
            
            let realSize = Double(size) / Double(multiple * multiple)
            
            fileSize = String(format: "%.2lg MB", realSize)
        
        } else if size > multiple {
            
            let realSize = Double(size) / Double(multiple)
            
            fileSize = String(format: "%.2lg KB", realSize)
        
        } else {
        
             fileSize = "\(size) B"
        }
        
        return fileSize
    }
 }
 
// MARK: - 沙盒中的目录位置
 extension FileManager {
    
    /// 应用主目录 位置
    ///
    /// - Returns: 应用主目录的路径
    static func homeDirectory() -> String {
        
        return NSHomeDirectory()
    }
    
    /// tmp目录 位置
    ///
    /// - Returns: tmp目录的路径
    static func tmpDirectory() -> String {
        
        return NSTemporaryDirectory()
    }
    
    /// 应用的详细 位置
    ///
    /// - Returns: 应用的详细路径
    static func applicationDirectory() -> String? {
        
        let paths =
            NSSearchPathForDirectoriesInDomains(
                .applicationDirectory,
                .userDomainMask,
                true
        )
        
        return paths.first
    }
    
    
    /// 应用的 document 位置
    ///
    /// - Returns: document 路径
    static func documentDirectory() -> String? {
        
        let paths =
            NSSearchPathForDirectoriesInDomains(
                .documentDirectory,
                .userDomainMask,
                true
        )
        
        return paths.last
    }
    
    
    /// Cache的位置
    ///
    /// - Returns: cache的位置
    static func cacheDirectory() -> String? {
        
        let paths =
            NSSearchPathForDirectoriesInDomains(
                .cachesDirectory,
                .userDomainMask,
                true
        )
        
        return paths.first
    }
    
    
    /// 偏好设置的 位置
    ///
    /// - Returns: preference 路径
    static func preferenceDirectory() -> String? {
        
        let paths =
            NSSearchPathForDirectoriesInDomains(
                .libraryDirectory,
                .userDomainMask,
                true
        )
        
        if let path =  paths.first {
            
            return path + "/Preference"
        }
        
        return nil
    }
 }
