//
//  ViewController.swift
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
import UBTokenBar

let defaultTokenBarHeight: CGFloat = 30

class ViewController: UIViewController, UBTokenBarDelegate {
    var tokenBar: UBTokenBar?
    var tokenBarConstraints: [NSLayoutConstraint]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false

        let tokenBar = UBTokenBar()
        tokenBar.delegate = self
        tokenBar.placeholderText = "Enter text and press enter to add a token"
        self.view.addSubview(tokenBar)
        self.tokenBar = tokenBar

        // Setup initial constraints for the token bar
        let leadingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: tokenBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: tokenBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: defaultTokenBarHeight)
        let tokenBarConstraints = [leadingConstraint, trailingConstraint, topConstraint, heightConstraint]
        self.view.addConstraints(tokenBarConstraints)
        self.tokenBarConstraints = tokenBarConstraints
    }

    // UBTokenBarDelegate

    func shouldAddToken(tokenToAdd: UBToken) -> Bool {
        return true
    }

    func shouldDeleteToken(tokenToDelete: UBToken) -> Bool {
        return true
    }

    func tokenForTokenBarText(currentTokenBarText: String) -> UBToken? {
        return UBToken(title: currentTokenBarText, object: currentTokenBarText as NSObject)
    }

    func tokenBarTextDidChange(newTokenBarText: String) {
    }

    func tokenBarSizeDidChange(newTokenBarSize: CGSize) {
        guard let tokenBar = self.tokenBar else {
            return
        }

        if let existingTokenBarConstraints = self.tokenBarConstraints {
            self.view.removeConstraints(existingTokenBarConstraints)
        }

        let leadingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: tokenBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: tokenBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newTokenBarSize.height)

        let tokenBarConstraints = [leadingConstraint, trailingConstraint, topConstraint, heightConstraint]
        self.view.addConstraints(tokenBarConstraints)
        self.tokenBarConstraints = tokenBarConstraints
    }
}
