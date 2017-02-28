//
//  UBTokenBarTextField.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
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
