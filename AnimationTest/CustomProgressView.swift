//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

@IBDesignable class CustomProgressView: UIView {

    @IBInspectable var progress: Double = 0.5 { didSet { updateProgress() } }
    var displayProgress: Double = 0.0
    
    var animator: UIViewPropertyAnimator?
    
    override func draw(_ rect: CGRect) {
        TestStyleKit.drawProgressDisplay(frame: rect, resizing: .aspectFit, progress: CGFloat(displayProgress))
    }

    func updateProgress() {
        animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut) {
            NSLog("SD:\(self.progress)")
            self.displayProgress = self.progress
        }
        animator?.startAnimation()
    }
    
    func updateAnimation() {
        animator?.fractionComplete
    }
}
