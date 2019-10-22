//
//  ReflectionView.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/22.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class ReflectionView: UIView {

    override class var layerClass: AnyClass {
        return CAReplicatorLayer.self;
    }
    
    func setUp() -> Void {
        
        let layer = self.layer as! CAReplicatorLayer
        layer.instanceCount = 2;
        
        var transform = CATransform3DIdentity;
        let verticalOffset = self.bounds.size.height + 2;//反射图片距离主图距离
        transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
        transform = CATransform3DScale(transform, 1, -1, 0);
        layer.instanceTransform = transform;
        
        layer.instanceAlphaOffset = -0.6
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.setUp()
    }
    

}
