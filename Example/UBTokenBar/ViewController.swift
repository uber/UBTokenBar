//
//  ViewController.swift
//  UBTokenBar
//
//  Created by Maxwell Elliott on 02/23/2017.
//  Copyright (c) 2017 Maxwell Elliott. All rights reserved.
//

import UIKit
import UBTokenBar

let defaultTokenBarHeight: CGFloat = 30

class ViewController: UIViewController, UBTokenBarDelegate {
    var tokenBar: UBTokenBar?

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
        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, heightConstraint])
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
        self.view.removeConstraints(self.view.constraints)

        let leadingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: tokenBar, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: tokenBar, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 20)
        let heightConstraint = NSLayoutConstraint(item: tokenBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: newTokenBarSize.height)

        self.view.addConstraints([leadingConstraint, trailingConstraint, topConstraint, heightConstraint])
    }
}

