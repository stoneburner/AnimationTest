//
//  ViewController.swift
//  AnimationTest
//
//  Created by Alexander Kasimir on 28.07.19.
//  Copyright © 2019 Alexander Kasimir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: CircleProgressView!

    @IBOutlet weak var smallCircleView: CircleProgressView!
    @IBOutlet weak var smallCircleView2: CircleProgressView!
    @IBOutlet weak var smallCircleView3: CircleProgressView!
    @IBOutlet weak var smallCircleView4: CircleProgressView!


    override func viewDidLoad() {
        super.viewDidLoad()
        smallCircleView.progress = 0.3
        smallCircleView.layoutSubviews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func setRandomValueTapped(_ sender: Any) {
        progressView.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView2.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView3.progress = CGFloat(Double.random(in: 0...1))
        smallCircleView4.progress = CGFloat(Double.random(in: 0...1))
    }
    
}

