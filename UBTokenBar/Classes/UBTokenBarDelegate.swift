//
//  UBTokenBarDelegate.swift
//  UBTokenBar
//
//  Copyright (c) 2017 Uber Technologies, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
