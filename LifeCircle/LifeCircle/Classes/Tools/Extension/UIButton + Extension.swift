 

import UIKit
 
 extension UIButton {
    
    convenience init?(normalImage: UIImage?, highlightedImage: UIImage?) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(highlightedImage, for: .highlighted)
    }
    
    convenience init?(normalImage: UIImage?, highlightedImage: UIImage?, addTarget target: Any?, action: Selector, for event: UIControl.Event) {
        
        self.init()
        
        setImage(normalImage, for: .normal)
        setImage(highlightedImage, for: .highlighted)
        
        addTarget(target, action: action, for: event)
    }
 }