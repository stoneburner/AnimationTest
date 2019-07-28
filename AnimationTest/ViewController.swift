//
//  ViewController.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CustomProgressView!
    private let animatedLayer = ProgressAnimationLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        animatedLayer.setNeedsDisplay()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animatedLayer.contentsScale = UIScreen.main.scale
        animatedLayer.frame = progressView.bounds
        animatedLayer.setValue(false, forKey: "state")
        progressView.layer.addSublayer(animatedLayer)
    }

    @IBAction func setRandomValueTapped(_ sender: Any) {
        let value = Double.random(in: 0...1)

        let layerState : Bool = !((animatedLayer.value(forKey: "state") as AnyObject).boolValue)!
        let timing : CAMediaTimingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        NSLog("setting progress to:\(value)")
        CATransaction.begin()
        CATransaction.setAnimationTimingFunction(timing)
        animatedLayer.progress = CGFloat(value)
        CATransaction.commit()
        animatedLayer.setValue(layerState, forKey: "state")
    }
    
}

