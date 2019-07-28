//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

@IBDesignable class CustomProgressView: UIView {

    @IBInspectable var progress: Double = 0.5
    
    override func draw(_ rect: CGRect) {
        TestStyleKit.drawProgressDisplay(frame: rect, resizing: .aspectFit, progress: CGFloat(progress))
    }

}
