/*
 
 1.项目概述
    1.1 使用MVVM模式开发
    1.2 开发语言 Swift
 
 2.字体的使用:
    粗体: "PingFangSC-Semibold"
    常规: "PingFangSC-Regular"
    字体大小
        超大字号      30
        导航标题      18/20
        内容区域标题   17/16
        底部标签栏     14
        情景模式如cell中的字体       12
 
 
 3.语言适配
    1.图片方向： 要注意图片的方向性 尤其是 剪头
    2.判断设备的方向性的判断
    3.引导页的方向 属性设置
        pageControl的滚动样式要设为 .spe...
        collectionView会自动适配，不需要设置
    4.约束需要支持rtl，就必须要使用leading和trailing。
    5.调试语言
        项目-> Edit Scheme -> Run -> Options
        -> Application Language -> 选择语言
 
    6.文本适配
      创建strings文件
 
    7.info.plist的适配
        必须要设置模拟器才有效果
 
    8.货币符号的适配
 
    9.上架时适配多语言 在 itunes store中有文档需要写
 
    10.应用内语言切换  == 收藏网络链接
 
 
    11.推荐框架
 
    12. 查看 https://blog.csdn.net/cdblh/article/details/44347033 完成笔记
 
 =============================
 
 4.集成跳转第三方地图
 
     百度地图：baidumap
     高德地图：iosamap
     谷歌地图：comgooglemaps
     腾讯地图：qqmap
 
    1.设置白名单
    plist文件新增LSApplicationQueriesSchemes关键字，
    类型为NSArray，并在其下添加子目录，类型为NSString，
    内容为各地图对应的url Scheme。
 
 */
