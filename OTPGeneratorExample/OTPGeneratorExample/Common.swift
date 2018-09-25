//
//  Common.swift
//  OTPGeneratorExample
//
//  Created by tm on 2018/9/21.
//  Copyright © 2018年 tm. All rights reserved.
//

import Foundation

public enum OTPGeneratorType: Int, CustomStringConvertible {
    case HOTP
    case TOTP
    
    var title: String {
        switch self {
        case .HOTP:
            return NSLocalizedString("Counter based", comment: "Cell title")
        case .TOTP:
            return NSLocalizedString("Time based", comment: "cell title")
        }
    }
    
    public var description: String {
        switch self {
        case .HOTP:
            return "<OTPGeneratorType: HOTP>"
        case .TOTP:
            return "<OTPGeneratorType: TOTP>"
        }
    }
}


let DEFAULTS_SECRET_KEY     = "DEFAULTS_SECRET_KEY"
let DEFAULTS_COUNTER_KEY    = "DEFAULTS_COUNTER_KEY"
