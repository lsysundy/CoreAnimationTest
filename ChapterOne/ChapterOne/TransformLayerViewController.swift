//
//  TransformLayerViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/17.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class TransformLayerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set up the perspective transform
        var pt = CATransform3DIdentity;
        pt.m34 = -1.0/500;
        self.containerView.layer.sublayerTransform = pt;
        
        //set up the transform for cube 1 and add it
//        var c1t = CATransform3DIdentity;
//        c1t = CATransform3DTranslate(c1t, -100, 0, 0);
//        let cube1 = self.cubeWithTransform(transform: c1t);
//        self.containerView.layer.addSublayer(cube1);
        
//        //set up the transform for cube 2 and add it
        var c2t = CATransform3DIdentity;
        c2t = CATransform3DTranslate(c2t, 100, 0, 0);
        c2t = CATransform3DMakeRotation(-CGFloat.pi/4, 1, 0, 0);
        c2t = CATransform3DMakeRotation(-CGFloat.pi/4, 0, 1, 0);
        let cube2 = self.cubeWithTransform(transform: c2t);
        self.containerView.layer.addSublayer(cube2);
        

        
    }
    
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100);
        
        //apply a random color
        let red = CGFloat(arc4random() % 256) / 255.0;
        let green = CGFloat(arc4random() % 256) / 255.0;
        let blue = CGFloat(arc4random() % 256) / 255.0;
        face.backgroundColor = UIColor(displayP3Red: red, green: green, blue: blue, alpha: 1.0).cgColor
        face.transform = transform
        return face
    }
    
    func cubeWithTransform(transform: CATransform3D) -> CALayer {
        //create cub layer
        let cube = CATransformLayer();
        
        //add cube face 1
        var ct = CATransform3DMakeTranslation(0, 0, 50)
        cube.addSublayer(self.faceWithTransform(transform: ct))
        
//        //add cube face 2
        ct = CATransform3DMakeTranslation(50, 0, 0);
        ct = CATransform3DRotate(ct, CGFloat.pi/2, 0, 1, 0)
        cube.addSublayer(self.faceWithTransform(transform: ct));

        //add cube face 3
        ct = CATransform3DMakeTranslation(0, -50, 0);
        ct = CATransform3DRotate(ct, CGFloat.pi/2, 1, 0, 0);
        cube.addSublayer(self.faceWithTransform(transform: ct));

        //add cube face 4
        ct = CATransform3DMakeTranslation(0, 50, 0);
        ct = CATransform3DRotate(ct, -CGFloat.pi/2, 1, 0, 0);
        cube.addSublayer(self.faceWithTransform(transform: ct));

        //add cube face 5
        ct = CATransform3DMakeTranslation(-50, 0, 0);
        ct = CATransform3DRotate(ct, -CGFloat.pi/2, 0, 1, 0);
        cube.addSublayer(self.faceWithTransform(transform: ct));

        //add cube face 6
        ct = CATransform3DMakeTranslation(0, 0, -50);
        ct = CATransform3DRotate(ct, CGFloat.pi, 0, 1, 0);
        cube.addSublayer(self.faceWithTransform(transform: ct));
        
        //center the cube layer within the container
        let containerSize = self.containerView.bounds.size;
        cube.position = CGPoint(x: containerSize.width/2.0, y: containerSize.height/2.0);
        
        //apply the transform and return
        cube.transform = transform;
        return cube
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
