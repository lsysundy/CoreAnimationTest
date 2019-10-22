//
//  CACradientLayerViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/21.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class CACradientLayerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var replicatorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //CAGradientLayer
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.containerView.bounds;
        self.containerView.layer.addSublayer(gradientLayer);
        
        //简单变换
//        gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor];
        
        //locations变换 locations如果传入，需保证locations的count与colors的count相同,否则会空白
        gradientLayer.colors = [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor];
        gradientLayer.locations = [0.0, 0.25, 0.5];
        
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0);
        gradientLayer.endPoint = CGPoint(x: 1, y: 1);
        
        
        
        //CAReplicatorLayer重复图层 实际应用：导弹轨迹云或者粒子爆炸
        let replicator = CAReplicatorLayer();
        replicator.frame = self.replicatorView.bounds;
        self.replicatorView.layer.addSublayer(replicator);

        //configure the replicator
        replicator.instanceCount = 10;

        //apply a transform for each instance
        var transform = CATransform3DIdentity;
        transform = CATransform3DTranslate(transform, 0, 200, 0);
        transform = CATransform3DRotate(transform, CGFloat.pi / 5.0, 0, 0, 1);
        transform = CATransform3DTranslate(transform, 0, -200, 0);
        replicator.instanceTransform = transform;

        //apply a color shift for each instance
        //逐步减少蓝绿通道，逐渐将图层转换成红色
        replicator.instanceBlueOffset = -0.1;
        replicator.instanceGreenOffset = -0.1;

        //create a sublayer and place it inside the replicator
        let layer = CALayer();
        layer.frame = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0);
        layer.backgroundColor = UIColor.white.cgColor;
        replicator.addSublayer(layer);
        
        
    }
    

    

}
