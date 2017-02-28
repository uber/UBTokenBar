//
//  UBTokenBarDelegate.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

/// The delegate for the UBTokenBar class
public protocol UBTokenBarDelegate : class {
    /**
      Called before a token is added to the token bar. Return true here to add
      the token to the UBTokenBar

      - Parameter tokenToAdd: The UBToken the UBTokenBar wants to add

      - Returns: A boolean representing if the UBToken should be added to the
      UBTokenBar
    */
    func shouldAddToken(tokenToAdd: UBToken) -> Bool
    /**
      Called before a token is removed from the token bar. Return true here to
      remove the token to the UBTokenBar

      - Parameter tokenToAdd: The UBToken the UBTokenBar wants to add

      - Returns: A boolean representing if the UBToken should be added to the
      UBTokenBar
    */
    func shouldDeleteToken(tokenToDelete: UBToken) -> Bool
    /**
      Called when the UBTokenBar wants to create a new UBToken given the
      currentTokenBarText string

      - Parameter currentTokenBarText: The text the UBTokenBar can use to create
      a new UBToken

      - Returns: A UBToken if the consumer wishes to create one, return nil if
      you do not wish to create a token with this text
    */
    func tokenForTokenBarText(currentTokenBarText: String) -> UBToken?
    /**
      Called when the UBTokenBar text has changed

      - Parameter currentTokenBarText: The current text of the UBTokenBar
    */
    func tokenBarTextDidChange(newTokenBarText: String)
    /**
      Called when the UBTokenBar size has changed. Consumers should adjust their
      constraints to properly enclose the new size of the UBTokenBar.

      - Parameter newTokenBarSize: The new size of the UBTokenBar
    */
    func tokenBarSizeDidChange(newTokenBarSize: CGSize)
}
