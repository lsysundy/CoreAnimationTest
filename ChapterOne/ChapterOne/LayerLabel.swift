//
//  LayerLabel.swift
//  ChapterOne
//
//  Created by 刘帅仪 on 2019/10/17.
//  Copyright © 2019 刘帅仪. All rights reserved.
//

import UIKit

class LayerLabel: UILabel {

    override class var layerClass: AnyClass {
        //this makes our label create a CATextLayer
        return CATextLayer.self;
    }
    
    func textLayer() -> CATextLayer {
        return self.layer as! CATextLayer;
    }
    
    func setUp() -> Void {
        self.text = self.text;
        self.textColor = self.textColor;
        self.font = self.font;
        
        //we should really derive these from the UILabel settings too but that's complicated,
        //so for now we'll just hard-code them
        self.textLayer().alignmentMode = CATextLayerAlignmentMode.justified;
        self.textLayer().isWrapped = true;
        self.layer.display();
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
    
    override func awakeFromNib() {
        self.setUp();
    }
    
    
    
    
    

}


