//
//  UBTokenBarTextFieldDelegate.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation

protocol UBTokenBarTextFieldDelegate : class {
    func textFieldShouldReturn(textField: UITextField) -> Bool
    // Called whenever a user performs a backspace action on an empty text field. Usually you would delete a token in this case in your delegate code
    func textFieldBackspaceOnEmptyText()
    func textFieldTextDidChange(text: String)
}
