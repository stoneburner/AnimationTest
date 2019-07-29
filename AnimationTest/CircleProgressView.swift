//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

private extension TestStyleKit {
    static func drawAnimatedProgressDisplay (_ frame: CGRect, resizing: TestStyleKit.ResizingBehavior, progress: CGFloat) {
        TestStyleKit.drawProgressDisplay(frame: frame, resizing: resizing, progress: progress)
    }
}

@IBDesignable class CircleProgressView: UIView, AnimatedUIView {

    @IBInspectable var progress: CGFloat = 0.5 { didSet { updateValue() } }

    var stateKeyName = "state"
    var animatedLayer = ProgressAnimationHelperLayer(drawingFunction: TestStyleKit.drawAnimatedProgressDisplay)

    override func layoutSubviews() {
        setupAnimationLayer()
        animatedLayer.frame = self.bounds
    }

}
