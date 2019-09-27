//
//  ViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/9/26.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, CALayerDelegate {

    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var coneView: UIView!
    @IBOutlet weak var shipView: UIView!
    @IBOutlet weak var iglooView: UIView!
    @IBOutlet weak var anchorView: UIView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        ios赋值不是CGImage，得到的图层会空白mac os上CGImage&NSImage类型的值都起作用
        
//        let image = UIImage(named: "snow.jpeg");
//        self.layerView.layer.contents = image?.cgImage;
        //等同于view的contentMode, 设置内容在图层的边界中怎么对其
//        self.layerView.layer.contentsGravity = CALayerContentsGravity.resizeAspect;
        
    //与UIImage不同，CGImage没有拉伸的概念，用UIImage读取图片时，当把layer的contentsGravity值设置为center时，它读取了Retina版本的图片，CGImage设置图层内容是，拉伸这个元素在转换时丢失了，可以通过手动设置contentsScale来修复
        //contentsScale: defaul 1.0 表示每个点1个像素绘制图片，2.0 每个点2个像素
        
//        self.layerView.layer.contentsGravity = CALayerContentsGravity.center;
        //fix blow up problem to match image
//        self.layerView.layer.contentsScale = image!.scale; //UIScreen.main.scale
        
        //UIView的clipsToBounds 用来决定是否显示超出边界的内容
        //CALayer的masksToBounds 等效
//        self.layerView.layer.masksToBounds = true;
//        self.layerView.layer.contentsRect = CGRect(x: 0, y: 0, width: 0.5, height: 0.5);
        
        //拼图
        let image1 = UIImage(named: "snow.jpeg");
        self.addSpriteImage(image: image1, rect: CGRect(x: 0, y: 0, width: 0.5, height: 0.5), layer: self.coneView.layer);
        self.addSpriteImage(image: image1, rect: CGRect(x: 0.5, y: 0, width: 0.5, height: 0.5), layer: self.shipView.layer);
        self.addSpriteImage(image: image1, rect: CGRect(x: 0, y: 0.5, width: 0.5, height: 0.5), layer: self.iglooView.layer);
        self.addSpriteImage(image: image1, rect: CGRect(x: 0.5, y: 0.5, width: 0.5, height: 0.5), layer: self.anchorView.layer);
        
        
        //contentsCenter
        self.addSpriteImage(image: image1, rect: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5), layer: self.button1.layer);
        self.addSpriteImage(image: image1, rect: CGRect(x: 0.25, y: 0.25, width: 0.5, height: 0.5), layer: self.button2.layer);
        
        
        //core Graphics 绘制寄存图
        let blueLayer = CALayer();
        blueLayer.frame = CGRect(x: 50.0, y: 50.0, width: 100.0, height: 100.0);
        blueLayer.backgroundColor = UIColor.blue.cgColor;
        blueLayer.delegate = self;
        blueLayer.contentsScale = UIScreen.main.scale;
        self.layerView.layer.addSublayer(blueLayer);

        blueLayer.display();
        
        
    }
    
    func addSpriteImage(image: UIImage!, rect: CGRect!, layer: CALayer!) -> Void {
        
        layer.contents = image.cgImage;
        layer.contentsGravity = CALayerContentsGravity.resizeAspect;
        layer.contentsRect = rect;
        
    }
    
    func draw(_ layer: CALayer, in ctx: CGContext) {
//        CGContext.setLineWidth(<#T##self: CGContext##CGContext#>)
    }
    
    


}

