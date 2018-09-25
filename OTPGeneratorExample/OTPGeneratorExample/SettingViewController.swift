//
//  SettingViewController.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/21.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = UserDefaults.standard.string(forKey: DEFAULTS_SECRET_KEY)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: -
    
    @IBAction func cancelButtonAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonAction(_ sender: Any) {
        UserDefaults.standard.set(textField.text, forKey: DEFAULTS_SECRET_KEY)
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }
    
}
