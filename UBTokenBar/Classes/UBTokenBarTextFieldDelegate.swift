//
//  UBTokenBarTextFieldDelegate.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
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
