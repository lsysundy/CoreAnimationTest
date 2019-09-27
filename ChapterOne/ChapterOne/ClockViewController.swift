//
//  ClockViewController.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/9/27.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class ClockViewController: UIViewController {

    @IBOutlet weak var clockView: UIView!
    @IBOutlet weak var hourHand: UIView!
    @IBOutlet weak var minuteHand: UIView!
    @IBOutlet weak var secondHand: UIView!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clockView.layer.cornerRadius = 120;
        self.clockView.layer.borderWidth = 2;
        self.clockView.layer.borderColor = UIColor.black.cgColor;
        
        self.secondHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9);
        self.minuteHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9);
        self.hourHand.layer.anchorPoint = CGPoint(x: 0.5, y: 0.9);

        let displayLink: CADisplayLink = CADisplayLink(target: self, selector: #selector(self.tick));
        displayLink.add(to: RunLoop.main, forMode: RunLoop.Mode.common);
        
//        self.timer = Timer(timeInterval: 1.0, target: self, selector: #selector(self.tick), userInfo: "", repeats: true);
//        self.tick()
        
        
        
    }
    
    @objc func tick() -> Void {
        let calendar = Calendar.init(identifier: Calendar.Identifier.chinese);
        let date:Date = Date()
        
        let hour: Int = calendar.component(Calendar.Component.hour, from: date);
        let hourAngle: Double = (Double.pi * 2 / 60) * Double(hour);
        self.hourHand.transform = CGAffineTransform(rotationAngle: CGFloat(hourAngle));
        
        let minute: Int = calendar.component(Calendar.Component.minute, from: date);
        let minuteAngle: Double = (Double.pi * 2 / 60) * Double(minute);
        self.minuteHand.transform = CGAffineTransform(rotationAngle: CGFloat(minuteAngle));
        
        let second: Int = calendar.component(Calendar.Component.second, from: date);
        let secondAngle: Double = (Double.pi * 2 / 60) * Double(second);
        self.secondHand.transform = CGAffineTransform(rotationAngle: CGFloat(secondAngle));

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
