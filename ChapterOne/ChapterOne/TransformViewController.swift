//
//  TransformViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/9/29.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class TransformViewController: UIViewController {

    @IBOutlet weak var layerView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var layerView1: UIImageView!
    @IBOutlet weak var layerView2: UIImageView!
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var innerView: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //CALayer有transform属性，类型为CATransform3D，不是CGAffineTransform
        //CALayer对应于UIView的transform属性叫做affineTransform
        
        let image = UIImage(named: "jcy.jpg");
        self.layerView.layer.contents = image?.cgImage;
        self.layerView.layer.contentsGravity = CALayerContentsGravity.resizeAspect;
        
        //view旋转45度
//        let transform: CGAffineTransform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 4)
//        self.layerView.transform = transform//CATransform3DMakeRotation(CGFloat(Double.pi / 4), 0, 1, 0);
        
        
        //先缩小50% 再旋转30度 最后香油移动10个像素
//        var transform = CGAffineTransform.identity;
//        self.layerView.transform = CGAffineTransform.init(scaleX: 0.5, y: 0.5);
//        self.layerView.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 6);
//        self.layerView.transform = CGAffineTransform.init(translationX: 20, y: 0)
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
//            UIView.animate(withDuration: 1) {
//                self.layerView.layer.transform = CATransform3DRotate(self.layerView.layer.transform, CGFloat.pi/2, 1, 1, 1);
//                self.layerView.layer.transform = CATransform3DScale(self.layerView.layer.transform, 2, 2, 1);
//
//                self.layerView.layer.transform = CATransform3DTranslate(self.layerView.layer.transform, 50, 50, 0);
//            }
//        }
        
        
        var transform : CATransform3D = CATransform3DIdentity;
        transform.m34 = -1.0 / 500.0; //m34:默认值0，用于做透视
        transform = CATransform3DRotate(transform, CGFloat.pi/4, 0, 1, 0);
        self.layerView.layer.transform = transform;
        
        
        //two View
        var persepective = CATransform3DIdentity;
        persepective.m34 = -1.0/500;
        self.contentView.layer.sublayerTransform = persepective;
        let transform1 = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 1, 0)
        self.layerView1.layer.transform = transform1
        let transform2 = CATransform3DMakeRotation(CGFloat.pi/4, 0, 1, 0)//CGFloat.pi旋转180度
        self.layerView2.layer.transform = transform2
        
        //视图背面是一个镜像对称的图片，图层是双面绘制的
        self.layerView2.layer.isDoubleSided = false //单面绘制
        
        
        
        //outer & inner
        //内部视图相对外部视图做了相反的变换，两个变换将被相互抵消（绕z轴旋转）
//        let outer = CATransform3DMakeRotation(CGFloat.pi/4, 0, 0, 1);
//        self.outerView.layer.transform = outer;
//        let inner = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 0, 1);
//        self.innerView.layer.transform = inner;
        
        
        //绕Y轴旋转
        var outer = CATransform3DIdentity;
        outer.m34 = -1.0/500.0;
        outer = CATransform3DRotate(outer, CGFloat.pi/4, 0, 1, 0);
        self.outerView.layer.transform = outer;
        
        var inner = CATransform3DIdentity;
        inner.m34 = -1.0/500.0;
        inner = CATransform3DRotate(inner, -CGFloat.pi/4, 0, 1, 0);
        self.innerView.layer.transform = inner;
        
        
        
        
        

    }
    
    
    
    

}
