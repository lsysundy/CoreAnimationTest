//
//  CATiledLayerViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/22.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class CATiledLayerViewController: UIViewController, CALayerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //在内存受限的设备上，高效绘制在iOS上的大图，防止阻塞线程
        //所有显示在屏幕上的图片最终都会转化为OpenGLd纹理，同时OpenGL有一个最大纹理尺寸（通常是2048*2048或4096*4096，取决于设备型号）
        //if你想在单个纹理中显示一个比这大的图，及时图片已经存在与内存中了，你仍然会遇到很大的性能问题，因为CA强制用CPU处理图片而不是更快的GPU
        
        let tileLayer = CATiledLayer();
        tileLayer.frame = CGRect(x: 0, y: 0, width: 2048, height: 2048);
        tileLayer.delegate = self as? CALayerDelegate;
        self.scrollView.layer.addSublayer(tileLayer);
        
        self.scrollView.contentSize = tileLayer.frame.size;
        tileLayer.setNeedsDisplay();
        
        
    }
    
    func draw(_ layer: CATiledLayer, in ctx: CGContext) {
        //determine tile coordinate
        let bounds = ctx.boundingBoxOfPath;
        let x = floor(bounds.origin.x / layer.tileSize.width)
        let y = floor(bounds.origin.y / layer.tileSize.height)
        
        
        
    }
    
    
    

    

}
