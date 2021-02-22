//
//  Test1ViewController.swift
//  iosAnalyticsTest
//
//  Created by vivek G on 20/02/21.
//  Copyright © 2021 Vivek. All rights reserved.
//

import UIKit
import CleverTapSDK

class Test1ViewController: UIViewController {

    @IBOutlet weak var txtInitialText : VGTextField!
    @IBOutlet weak var txtTargetedText : VGTextField!
    
    @IBOutlet weak var lblErrorText : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    @IBAction func btnCheckRepeatText(sender:Any)
    {
        CleverTap.sharedInstance()?.recordEvent("checked Repeated text inn string")
        if txtInitialText.chechEmpty() || txtTargetedText.chechEmpty()
        {
            self.lblErrorText.text = "Please enter initial text and targeted text"
            Animations.requireUserAtencion(on: lblErrorText)
            return
        }
        
        let fruitsSet = Set(Array(txtInitialText.text ?? ""))
        let vegSet = Set(Array(txtTargetedText.text ?? ""))
        
        let arrDifferentElement = Array(fruitsSet.symmetricDifference(vegSet))
        print(arrDifferentElement)
        
        if arrDifferentElement.count == 0 // id diffence count 0 = equal set
        {
            self.lblErrorText.text = "Text Found : true"
        }
        else
        {
            self.lblErrorText.text = "Text Found : false"
        }
        
    }
}
