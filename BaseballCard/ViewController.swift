//
//  ViewController.swift
//  BaseballCard
//
//  Created by Christian Hurtado on 7/22/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var backgroundView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGreen
        self.navigationItem.title = "PLAY BALL"
        backgroundView.image = UIImage(named: "BaseballBackground")
    }

    @IBAction func beginButton(_ sender: UIButton) {
        
    }
    
}

