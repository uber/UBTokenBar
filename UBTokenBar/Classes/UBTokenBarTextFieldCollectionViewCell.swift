//
//  UBTokenBarTextFieldCollectionViewCell.swift
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

class UBTokenBarTextFieldCollectionViewCell: UICollectionViewCell, UBTokenBarTextFieldDelegate {
    let textField = UBTokenBarTextField(frame: CGRect.zero)
    public var computedWidth: CGFloat = 0
    public var minimumWidth: CGFloat = 50
    weak var delegate: UBTokenBarTextFieldDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textField.tokenBarTextFieldDelegate = self
        self.contentView.addSubview(self.textField)

        if self.tokenBarIsRTL() {
            self.transform = CGAffineTransform(scaleX: -1, y: 1)
            self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
            self.textField.textAlignment = .right
        }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // View managment code

    override func updateConstraints() {
        let leadingConstraint = NSLayoutConstraint(item: self.textField, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.textField, attribute: .trailing, relatedBy: .equal, toItem: self.contentView, attribute: .trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.textField, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.textField, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1.0, constant: 0)

        self.contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        super.updateConstraints()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        guard let layoutAttributesCopy = layoutAttributes.copy() as? UICollectionViewLayoutAttributes else {
            return layoutAttributes
        }

        if self.computedWidth == 0 {
            self.computedWidth = self.textField.intrinsicContentSize.width
            if self.computedWidth < self.minimumWidth {
                self.computedWidth = self.minimumWidth
            }
            layoutAttributesCopy.size.width = self.computedWidth
        }
        return layoutAttributesCopy
    }

    override func prepareForReuse() {
        self.computedWidth = 0
        self.textField.text = nil
        super.prepareForReuse()
    }

    // UBTokenBarTextFieldDelegate

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let delegate = self.delegate {
            return delegate.textFieldShouldReturn(textField: textField)
        }
        return false
    }

    func textFieldBackspaceOnEmptyText() {
        if let delegate = self.delegate {
            delegate.textFieldBackspaceOnEmptyText()
        }
    }

    internal func textFieldTextDidChange(text: String) {
        if let delegate = self.delegate {
            delegate.textFieldTextDidChange(text: text)
        }
    }
}

