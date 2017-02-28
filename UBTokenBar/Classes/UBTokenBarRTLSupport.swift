//
//  UBTokenBarRTLSupport.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

extension UIView {
    func tokenBarIsRTL() -> Bool {
        if #available(iOS 9.0, *) {
            if UIView.userInterfaceLayoutDirection(for: self.semanticContentAttribute) == .rightToLeft {
                return true
            }
        } else {
            // Fallback on earlier versions
            if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
                return true
            }
        }

        return false
    }
}
