//
//  ViewController.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/21.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit
import OTPGenerator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let generator = TOTPGenerator(secret: "GEZDGNBVGY3TQOJQGEZDGNBVGY3TQOJQ", period: 30, pinLength: 6, algorithm: .sha1)
        let token = generator?.generateOTP()
        print("token:\(token)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

