//
//  UBTokenBarTextField.swift
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

import UIKit
import Foundation

class UBTokenBarTextField: UITextField, UITextFieldDelegate {
    weak var tokenBarTextFieldDelegate: UBTokenBarTextFieldDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftView?.frame.size.width = 5
        self.rightView = nil
        self.delegate = self
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let delegate = self.tokenBarTextFieldDelegate {
            return delegate.textFieldShouldReturn(textField: textField)
        }
        return false
    }

    override func deleteBackward() {
        if let delegate = self.tokenBarTextFieldDelegate {
            if let text = self.text {
                if text.characters.count == 0 {
                    delegate.textFieldBackspaceOnEmptyText()
                }
            }
        }
        super.deleteBackward()
    }

    @objc private func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            self.tokenBarTextFieldDelegate?.textFieldTextDidChange(text: text)
        }
    }
}
