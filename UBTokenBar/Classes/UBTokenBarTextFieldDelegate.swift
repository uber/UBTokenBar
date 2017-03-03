//
//  UBTokenBarTextFieldDelegate.swift
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

/// The delegate for the UITextField embedded into the UBTokenBar
protocol UBTokenBarTextFieldDelegate : class {
    /**
      Called when the user has tried to enter a token using the return key on
      the keyboard

      - Parameter textField: The UITextField sender object.

      - Returns: A boolean representing if the text field should return and
      add a token to the UBTokenBar. This method will call shouldAddToken on the
      UBTokenBarDelegate.
    */
    func textFieldShouldReturn(textField: UITextField) -> Bool
    /**
      Called when the user has pressed the backspace key on an empty string
      UBTokenBar. Usually consumers would want to remove the last UBToken from
      the UBTokenBar in this situation. This method will call shouldDeleteToken
      on the UBTokenBarDelegate
    */
    func textFieldBackspaceOnEmptyText()
    /**
      Called when the user has changed the text in the UBTokenBar's text field

      - Parameter text: The new text in the text field
    */
    func textFieldTextDidChange(text: String)
}
