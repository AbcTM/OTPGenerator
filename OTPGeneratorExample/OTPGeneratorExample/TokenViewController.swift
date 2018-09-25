//
//  TokenViewController.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/21.
//  Copyright © 2018年 tm. All rights reserved.
//

import UIKit
import OTPGenerator

class TokenViewController: UIViewController {
    
    var generatorType: OTPGeneratorType?
    private var generator: OTPGenerator?
    private var generatorTimer: Timer?
    private var labelTimer: Timer?
    private var timeCounter = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initGenerator()
        refreshTokenLabel()
        if generatorType == .TOTP {
            self.refreshTimerLabel()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - action
    @IBAction func refreshAction(_ sender: Any) {
        refreshTokenLabel()
    }
    
    // MARK: -
    private func initGenerator() {
        guard
            let generatorType = generatorType,
            let secret = UserDefaults.standard.string(forKey: DEFAULTS_SECRET_KEY)
            else {
                descriptionLabel.text = NSLocalizedString("Incorrect setup", comment: "Incorrect setup")
                return
        }
        
        generator = GeneratorFactory.generatorWithSecretKey(key: secret, type: generatorType, secretIsBase32: false)
        
        if generatorType == .TOTP {
            generatorTimer = Timer.scheduledTimer(timeInterval: (generator as! TOTPGenerator).period, target: self, selector: #selector(self.refreshTokenLabel), userInfo: nil, repeats: true)
            labelTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.refreshTimerLabel), userInfo: nil, repeats: true)
        }
    }
    
    @objc func refreshTokenLabel() {
        if generatorType == .HOTP {
            titleLabel.text = (generator as! HOTPGenerator).generateOTP()
            let counter = GeneratorFactory.increaseCounter()
            descriptionLabel.text = NSLocalizedString("Token count: ", comment: "") + "\(counter)"
        } else {
            titleLabel.text = (generator as! TOTPGenerator).generateOTP()
        }
    }
    
    @objc func refreshTimerLabel() {
        if timeCounter == 0 {
            refreshTokenLabel()
            timeCounter = Int((generator as! TOTPGenerator).period)
            descriptionLabel.text = NSLocalizedString("Next in... ", comment: "") + "\(timeCounter)s"
        } else {
            timeCounter -= 1
            descriptionLabel.text = NSLocalizedString("Next in... ", comment: "") + "\(timeCounter)s"
        }
    }
    
}
