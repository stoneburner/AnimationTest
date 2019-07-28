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
    private static let keyName = "progress"

    override init() {
        super.init()
        progress = 0
        needsDisplayOnBoundsChange = true
    }

    override init(layer: Any) {
        super.init(layer: layer)
        if let layer = layer as? ProgressAnimationLayer {
            progress = layer.progress
        }
    }

    override class func needsDisplay(forKey key: (String?)) -> Bool {
        if key! == keyName {
            return true
        } else {
            return super.needsDisplay(forKey: key!)
        }
    }

    override func action(forKey event: String) -> CAAction? {
        if event == ProgressAnimationLayer.keyName {
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

    @IBInspectable var progress: CGFloat = 0.5 { didSet { updateValue() } }
    private let stateKeyName = "state"
    private let animatedLayer = ProgressAnimationLayer()

    func setupAnimationLayer() {
        guard self.layer.sublayers == nil || self.layer.sublayers?.contains(animatedLayer) == false else { return }
        animatedLayer.contentsScale = UIScreen.main.scale
        animatedLayer.frame = self.bounds
        animatedLayer.setValue(false, forKey: stateKeyName)
        self.layer.addSublayer(animatedLayer)
        animatedLayer.setNeedsDisplay()
    }

    private func updateValue() {
        let layerState : Bool = !((animatedLayer.value(forKey: stateKeyName) as AnyObject).boolValue)!
        let timing : CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timing)
        animatedLayer.progress = progress
        CATransaction.commit()
        animatedLayer.setValue(layerState, forKey: stateKeyName)
    }

    override func layoutSubviews() {
        setupAnimationLayer()
        animatedLayer.frame = self.bounds
    }
}
