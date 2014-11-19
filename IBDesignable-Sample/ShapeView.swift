//
//  ShapeView.swift
//  IBDesignable-Sample
//
//  Created by Safx Developer on 2014/11/18.
//  Copyright (c) 2014年 Safx Developers. All rights reserved.
//

import UIKit

@IBDesignable class ShapeView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
    
    @IBInspectable var shapeBackgroundColor: UIColor? {
        get { return UIColor(CGColor: self.layer.backgroundColor) }
        set { self.layer.backgroundColor = newValue?.CGColor }
    }
}

