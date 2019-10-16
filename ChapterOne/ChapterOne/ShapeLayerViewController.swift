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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //创建图层路径 不需要考虑CGPath的手动释放
        let path: UIBezierPath = UIBezierPath.init()
        path.move(to: CGPoint.init(x: 175, y: 100))
        path.addArc(withCenter: CGPoint.init(x: 150, y: 100), radius: 25, startAngle: 0, endAngle: 7, clockwise: true)
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
