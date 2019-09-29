//
//  zPositionViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/9/27.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class zPositionViewController: UIViewController, CALayerDelegate {

    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    
    var blueLayer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //green在red后面
        //zPosition改变图层显示顺序
        self.greenView.layer.zPosition = 1.0;
        
        self.blueLayer = CALayer()
        self.blueLayer.frame = CGRect(x: 10, y: 10, width: 100, height: 100);
        self.blueLayer.backgroundColor = UIColor.blue.cgColor;
        self.greenView.layer.addSublayer(self.blueLayer);
        
        
        
        self.greenView.layer.shadowOpacity = 0.5;
        self.redView.layer.shadowOpacity = 0.5;
        
        let squarePath : CGMutablePath = CGMutablePath.init()
        self.greenView.layer.shadowPath = squarePath;
        
        
        //shouldRasterize:可以实现组透明度，在应用透明度之前，图层及其子图层都会被整合成一个整体的图片，就没有都名都混合的问题了
        //与rasterizationScale一起使用，以防出现Retina屏幕像素化问题
        let button : UIButton = self.customButton();
        button.center = CGPoint(x: 50, y: 150);
        self.view.addSubview(button);
        
        let button2 = self.customButton();
        button2.center = CGPoint(x: 250, y: 150);
        button2.alpha = 0.5;
        self.view.addSubview(button2);
        
        button2.layer.shouldRasterize = true;
        button2.layer.rasterizationScale = UIScreen.main.scale;
        
        
    }
    
    func customButton() -> UIButton {
        
        
        var frame : CGRect = CGRect(x: 0, y: 0, width: 150, height: 50)
        let button: UIButton = UIButton(frame: frame);
        button.backgroundColor = UIColor.purple;
        button.layer.cornerRadius = 10;
        
        frame = CGRect(x: 20, y: 10, width: 110, height: 30);
        let label : UILabel = UILabel(frame: frame);
        label.text = "Hello World";
        label.textAlignment = NSTextAlignment.center;
        button.addSubview(label);
        return button;
        
        
//        self.redView.layer.rasterizationScale
//        self.redView.layer.shouldRasterize
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let point: CGPoint = ((touches as NSSet).anyObject() as AnyObject).location(in: self.view)//类型转换
        //hitTest：返回图层本身
        let layer: CALayer = self.greenView.layer.hitTest(point)!;
        if layer == self.blueLayer {
            let alertView = UIAlertController.init(title: "inside Blue Layer", message: nil, preferredStyle: UIAlertController.Style.alert);
            alertView.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                
            }))
            self.show(alertView, sender: nil);
        }else {
            let alertView = UIAlertController.init(title: "inside green Layer", message: nil, preferredStyle: UIAlertController.Style.alert);
            alertView.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
                
            }))
            self.show(alertView, sender: nil);
        }
//        if (self.greenView.layer.contains(point)) {
//            point = self.blueLayer.convert(point, from: self.greenView.layer);
//            if self.blueLayer.contains(point) {
//                let alertView = UIAlertController.init(title: "inside Blue Layer", message: nil, preferredStyle: UIAlertController.Style.alert);
//                alertView.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
//
//                }))
//                alertView.show(alertView, sender: nil);
//            }else {
//                let alertView = UIAlertController.init(title: "inside green Layer", message: nil, preferredStyle: UIAlertController.Style.alert);
//                alertView.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
//
//                }))
//            }
//        }
        
    }
    
    //可以实现随意控制CALayer布局，当bounds发生改变或者图层的 -setNeedsLayout被调用时，该函数执行
    //但不能做到像UIView的autoresizingMask和constrains（UIViewAutoresizingMask和NSLayoutConstraint）属性做到自适应
    func layoutSublayers(of layer: CALayer) {
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
