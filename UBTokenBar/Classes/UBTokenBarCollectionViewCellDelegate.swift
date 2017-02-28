//
//  UBTokenBarCollectionViewCellDelegate.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

protocol UBTokenBarCollectionViewCellDelegate : class {
    func tokenRemoveButtonTapped(token: UBToken, cell: UBTokenBarCollectionViewCell)
}

