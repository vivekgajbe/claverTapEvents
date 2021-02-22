//
//  ViewController.swift
//  iosAnalyticsTest
//
//  Created by vivek G on 20/02/21.
//  Copyright © 2021 Vivek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

