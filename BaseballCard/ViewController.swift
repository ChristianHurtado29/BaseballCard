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
        backgroundView.image = UIImage(named: "BaseballBackground")
    }


}

