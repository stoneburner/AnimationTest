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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func setRandomValueTapped(_ sender: Any) {
        let value = Double.random(in: 0...1)

        NSLog("setting progressview value to:\(value)")
        progressView.progress = CGFloat(value)
    }
    
}

