//
//  CustomProgressView.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

class ProgressAnimationLayer: CALayer {
    @NSManaged var progress: CGFloat

    override init() {
        super.init()
        progress = 0.5
        needsDisplayOnBoundsChange = true
    }

    override init(layer: Any) {
        super.init(layer: layer)

        if let layer = layer as? ProgressAnimationLayer {
            progress = layer.progress
        }
    }

    override class func needsDisplay(forKey key: (String?)) -> Bool {
        if key! == "progress" {
            return true
        } else {
            return super.needsDisplay(forKey: key!)
        }
    }

    override func action(forKey event: String) -> CAAction? {
        if event == "progress" {
            let animation = CABasicAnimation(keyPath: event)
            animation.fromValue = self.presentation()?.value(forKey: event)
            return animation
        } else {
            return super.action(forKey: event)
        }
    }

    override func draw(in ctx: CGContext) {
        UIGraphicsPushContext(ctx)
        let size = ctx.convertToUserSpace(CGSize(width: ctx.width, height: ctx.height))
        let rect = CGRect(origin: CGPoint.zero, size: size)
        TestStyleKit.drawProgressDisplay(frame: rect,
                                         resizing: .aspectFit,
                                         progress: progress)
        UIGraphicsPopContext()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
}

@IBDesignable class CustomProgressView: UIView {

    override func layoutSubviews() {
        //self.layer
        //mylayer.frame = self.bounds;
    }
}
