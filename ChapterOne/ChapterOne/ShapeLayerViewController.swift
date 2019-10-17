//
//  CubicViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/14.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class ShapeLayerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var attributedLabel: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建图层路径 不需要考虑CGPath的手动释放
        let path: UIBezierPath = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 175, y: 100))
        path.addArc(withCenter: CGPoint.init(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.move(to: CGPoint.init(x: 150, y: 125))
        path.addLine(to: CGPoint.init(x: 150, y: 175))
        path.addLine(to: CGPoint.init(x: 125, y: 225))
        path.move(to: CGPoint.init(x: 150, y: 175))
        path.addLine(to: CGPoint.init(x: 175, y: 225))
        path.move(to: CGPoint.init(x: 100, y: 150))
        path.addLine(to: CGPoint.init(x: 200, y: 150))
        
        //create shape layer
        let shapeLayer: CAShapeLayer = CAShapeLayer();
        shapeLayer.strokeColor = UIColor.red.cgColor;
        shapeLayer.fillColor = UIColor.clear.cgColor;
        shapeLayer.lineWidth = 5;
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round;
        shapeLayer.lineCap = CAShapeLayerLineCap.round;
        shapeLayer.path = path.cgPath;
        self.containerView.layer.addSublayer(shapeLayer)
        
        //圆角
        let rect = CGRect(x: 50, y: 50, width: 100, height: 100);
        let radii = CGSize(width: 20, height: 20);
        let corners = UIRectCorner.topRight.rawValue | UIRectCorner.bottomRight.rawValue;
        let radiusPath = UIBezierPath(roundedRect: rect, byRoundingCorners: UIRectCorner(rawValue: corners), cornerRadii: radii);
        
        //CATextLayer 包含UILabel所有绘制特性，并额外提供新特性
        //CATextLayer比UILabel渲染快得多 iOS6之前UILabels是通过WebKit来实现绘制的，会造成性能压力，CATextLayer使用Core Text
        let textLayer = CATextLayer();
        textLayer.frame = self.labelView.bounds;
        self.labelView.layer.addSublayer(textLayer);
        
        textLayer.foregroundColor = UIColor.black.cgColor;
        textLayer.alignmentMode = CATextLayerAlignmentMode.justified;
        textLayer.isWrapped = true;
        let font = UIFont.systemFont(ofSize: 15);
        textLayer.font = font
        textLayer.fontSize = font.pointSize;
        let text = "lorem ipsum dolor sit amet, consectetur adipiscing elit.Quisque massa arcu, eleifend vel varius in, facilisis pulvinar leo";
        textLayer.string = text;
        //文字会呈现像素化，因为不是Retina渲染，scontentScale用来决定图层内容以什么分辨率渲染
        //Retina渲染，设置以下属性
        textLayer.contentsScale = UIScreen.main.scale;
        
        //富文本
        let aTextLayer = CATextLayer();
        aTextLayer.frame = self.attributedLabel.bounds;
        aTextLayer.contentsScale = UIScreen.main.scale;
        self.attributedLabel.layer.addSublayer(aTextLayer);
        aTextLayer.alignmentMode = CATextLayerAlignmentMode.justified;
        aTextLayer.isWrapped = true;
        let mutableString = NSMutableAttributedString.init(string: text);
        
        let attribs = [NSAttributedString.Key.foregroundColor: UIColor.red.cgColor, NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any];
        mutableString.setAttributes(attribs, range: NSRange(location: 6, length: 5));
        
//        let attribs = [NSAttributedString.Key.foregroundColor: UIColor.red.cgColor, NSAttributedString.Key.und: font] as [NSAttributedString.Key : Any];
        aTextLayer.string = mutableString
        
        //行距字距
        
        
        
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
