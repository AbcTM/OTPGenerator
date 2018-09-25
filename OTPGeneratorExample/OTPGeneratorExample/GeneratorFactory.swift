//
//  GeneratorFactory.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/21.
//  Copyright © 2018年 tm. All rights reserved.
//

import Foundation
import OTPGenerator

class GeneratorFactory {
    
    static func generatorWithSecretKey(key: String, type: OTPGeneratorType, secretIsBase32: Bool = true) -> OTPGenerator {
        switch(type) {
        case .HOTP:
            var startCounter: UInt64 = 0
            let settings = UserDefaults.standard
            
            if let counter = settings.object(forKey: DEFAULTS_COUNTER_KEY) as? NSNumber {
                startCounter = counter.uint64Value
            }
            return HOTPGenerator(secret: key, counter: startCounter, secretIsBase32: secretIsBase32)!
            
        case .TOTP:
            return TOTPGenerator(secret: key, period: 30, secretIsBase32: secretIsBase32)!
        }
    }
    
    static func increaseCounter() -> UInt64 {
        var counterToSave: UInt64 = 1
        if let counter = UserDefaults.standard.object(forKey: DEFAULTS_COUNTER_KEY) as? NSNumber {
            counterToSave = counter.uint64Value + 1
        }
        
        UserDefaults.standard.set(NSNumber(value: counterToSave), forKey: DEFAULTS_COUNTER_KEY)
        UserDefaults.standard.synchronize()
        
        return counterToSave
    }
    
}
