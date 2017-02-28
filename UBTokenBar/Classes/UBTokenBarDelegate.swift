//
//  UBTokenBarDelegate.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

public protocol UBTokenBarDelegate : class {
    // Called before a token is added to the token bar, return true here to add the provided token
    func shouldAddToken(tokenToAdd: UBToken) -> Bool
    // Called before a token is deleted from the token bar, return true here to delete the provided token
    func shouldDeleteToken(tokenToDelete: UBToken) -> Bool
    // Called when ever the token bar is about to create a token with the current token bar text. Return a token here to add it to the token bar
    func tokenForTokenBarText(currentTokenBarText: String) -> UBToken?
    // Called whenever the TokenBar's text changes
    func tokenBarTextDidChange(newTokenBarText: String)
    // Called whenever the size of the token field has changed, update constraints in this method to expand/reduce the token bar
    func tokenBarSizeDidChange(newTokenBarSize: CGSize)
}

