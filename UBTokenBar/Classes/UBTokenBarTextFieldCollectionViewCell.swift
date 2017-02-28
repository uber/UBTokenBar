//
//  UBTokenBarTextFieldCollectionViewCell.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
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

