//
//  LSYScrollView.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/22.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit


//CAScrollLayer 图层中小地方显示大图片 类似contentRect区域展示图片拼图
//CA不处理用户输入，so CAScrollLayer不负责将触摸事件转换为滑动时间，既不渲染滚动条，也不实现如何iOS指定行为，，如滑动反弹
//CAScrollLayer没有类似UIScrollView的contentSize去做边界检查，会造成划出边界后无限滑下去
class LSYScrollView: UIView {

    override class var layerClass: AnyClass {
        return CAScrollLayer.self;
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUp();
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder);
    }
    
    func setUp() -> Void {
        self.layer.masksToBounds = true;
        let recognizer = UIPanGestureRecognizer(target: self, action: Selector(("pan:")));
        self.addGestureRecognizer(recognizer);
    }
    
    func pan(recognizer: UIPanGestureRecognizer) -> Void {
        
        var offset = self.bounds.origin;
        offset.x -= recognizer.translation(in: self).x;
        offset.y -= recognizer.translation(in: self).y;
        self.layer.scroll(offset);
        recognizer.setTranslation(CGPoint.zero, in: self);
        
    }
    
    override func awakeFromNib() {
        self.setUp();
    }

}
