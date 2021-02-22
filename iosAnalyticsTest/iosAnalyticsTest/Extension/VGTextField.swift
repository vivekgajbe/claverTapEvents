//
//  VGTextField.swift
//  iosAnalyticsTest
//
//  Created by vivek G on 20/02/21.
//  Copyright © 2021 Vivek. All rights reserved.
//

import UIKit

class VGTextField: UITextField {

    
    func chechEmpty() -> Bool
    {
        if self.text == ""
        {
            return true
        }
        return false
    }
}
