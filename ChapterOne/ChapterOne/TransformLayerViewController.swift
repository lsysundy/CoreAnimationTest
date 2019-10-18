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
        
        

        
    }
    
    func faceWithTransform(transform: CATransform3D) -> CALayer {
        
        let face = CALayer()
        face.frame = CGRect(x: -50, y: -50, width: 100, height: 100);
        
        //apply a random color
        let red = CGFloat(arc4random() % 256) / 255.0
        let green = CGFloat(arc4random() % 256) / 255.0
        let blue = CGFloat(arc4random() % 256) / 255.0
        
        
        
        return face
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
