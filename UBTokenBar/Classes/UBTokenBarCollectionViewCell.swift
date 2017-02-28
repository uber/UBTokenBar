//
//  UBTokenBarCollectionViewCell.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

open class UBTokenBarCollectionViewCell: UICollectionViewCell {
    weak var delegate: UBTokenBarCollectionViewCellDelegate?
    open var token: UBToken = UBToken(title: "Invalid Cell, Token not set", object: NSObject()) {
        didSet {
            self.updateCellForToken(newToken: token)
        }
    }

    override open var description: String {
        return "UBTokenBarCollectionViewCell; Token Title:'\(token.tokenTitle)', Token Object:'\(token.representedObject)'"
    }

    func maximumCellWidth() -> CGFloat {
        assertionFailure("UBTokenBarCollectionViewCell subclasses must specify a maximum possible cell width, this width should be valid with the provided UBTokenBarCollectionViewFlowLayout subclass' layout logic")
        return 0
    }

    func updateCellForToken(newToken: UBToken) {
    }
}
