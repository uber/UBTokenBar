//
//  UBTokenBarSearchIconDecorationViewCell.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
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
