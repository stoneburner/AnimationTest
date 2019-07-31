//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

class CircleProgressAnimationLayer: ProgressAnimationLayer {
    override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        let size = ctx.convertToUserSpace(CGSize(width: ctx.width, height: ctx.height))
        let rect = CGRect(origin: CGPoint.zero, size: size)
        TestStyleKit.drawProgressCircleDisplay(frame: rect, resizing: .aspectFit, progress: progress)
        UIGraphicsPopContext()
    }
}

@IBDesignable class CircleProgressView: UIView, AnimatedUIView {
    @IBInspectable var progress: CGFloat = 0.5 { didSet { updateValue() } }

    var animatedLayer: Progressable = CircleProgressAnimationLayer()
    var stateKeyName = "state"

    override func layoutSubviews() {
        setupAnimationLayer()
        animatedLayer.frame = self.bounds
    }

}
