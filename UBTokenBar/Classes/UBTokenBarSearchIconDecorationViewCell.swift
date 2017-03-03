//
//  UBTokenBarSearchIconDecorationViewCell.swift
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

class UBTokenBarSearchIconDecorationViewCell: UICollectionReusableView {
    var searchIcon: UIImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let bundle = Bundle(for: self.classForCoder)
        self.searchIcon.image = UIImage(named: "hourglass.png", in: bundle, compatibleWith: nil)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.searchIcon.contentMode = .scaleAspectFit
        self.searchIcon.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.searchIcon)

        if self.tokenBarIsRTL() {
            self.searchIcon.transform = CGAffineTransform(scaleX: -1, y: 1)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func updateConstraints() {
        let centerXConstraint = NSLayoutConstraint(item: self.searchIcon, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 3)
        let centerYConstraint = NSLayoutConstraint(item: self.searchIcon, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 3)
        let heightConstraint = NSLayoutConstraint(item: self.searchIcon, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 16)
        let widthConstraint = NSLayoutConstraint(item: self.searchIcon, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 16)
        self.addConstraints([centerXConstraint, centerYConstraint, heightConstraint, widthConstraint])
        super.updateConstraints()
    }
}
