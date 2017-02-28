//
//  UBToken.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

public class UBToken: NSObject {
    open var representedObject: NSObject
    open var tokenTitle: String

    public init(title: String, object: NSObject) {
        tokenTitle = title
        representedObject = object
    }

    open override func isEqual(_ object: Any?) -> Bool {
        guard let token = object as? UBToken else {
            return false
        }
        if self.tokenTitle != token.tokenTitle {
            return false
        }
        return self.representedObject.isEqual(token.representedObject)
    }
}
