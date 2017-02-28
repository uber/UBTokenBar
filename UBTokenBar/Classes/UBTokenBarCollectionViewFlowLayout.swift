//
//  UBTokenBarCollectionViewFlowLayout.swift
//  UBTokenBar
//
//  Created by MaxwellElliott on 2/24/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

let searchIconDecorationCellType = "UBTokenBarCollectionViewFlowLayout.searchIconDecorationCellType"

open class UBTokenBarCollectionViewFlowLayout: UICollectionViewFlowLayout {
    fileprivate var contentSize = CGSize.zero

    override init() {
        super.init()
        self.minimumInteritemSpacing = 5
        self.minimumLineSpacing = 5
        self.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        self.scrollDirection = .vertical
        self.estimatedItemSize = CGSize(width: 0, height: self.defaultItemHeight())
        self.register(UBTokenBarSearchIconDecorationViewCell.self, forDecorationViewOfKind: searchIconDecorationCellType)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    open func defaultItemHeight() -> CGFloat {
        return 26
    }

    open override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let currentItemAttributes = super.layoutAttributesForItem(at: indexPath)?.copy() as? UICollectionViewLayoutAttributes else {
            return nil
        }

        let sectionInset = self.sectionInset
        var currentItemRect = currentItemAttributes.frame

        // First item for the collectionView, do not try to use the previous index path to determine attributes
        if indexPath.item == 0 {
            currentItemRect.origin.x = sectionInset.left
            if let decorationLayoutAttributes = self.layoutAttributesForDecorationView(ofKind: searchIconDecorationCellType, at: IndexPath(item: 0, section: 0)) {
                currentItemRect.origin.x = decorationLayoutAttributes.frame.maxX + self.minimumInteritemSpacing
            }
            currentItemAttributes.frame = currentItemRect
            return currentItemAttributes
        }

        // Look at the previous index path item's attributes to determine this item's attributes
        let previousIndexPath = IndexPath(item: indexPath.item - 1, section: indexPath.section)

        guard let previousItemAttributes = self.layoutAttributesForItem(at: previousIndexPath)?.copy() as? UICollectionViewLayoutAttributes else {
            return nil
        }

        guard let collectionView = self.collectionView else {
            return nil
        }

        let collectionViewBounds = collectionView.bounds
        let previousItemRect = previousItemAttributes.frame

        var remainingLineWidth = collectionViewBounds.width - self.sectionInset.left - self.sectionInset.right - self.minimumInteritemSpacing

        if currentItemRect.maxY == self.sectionInset.top {
            if let decorationLayoutAttributes = self.layoutAttributesForDecorationView(ofKind: searchIconDecorationCellType, at: IndexPath(item: 0, section: 0)) {
                remainingLineWidth = collectionViewBounds.width - self.sectionInset.left - self.sectionInset.right - decorationLayoutAttributes.size.width - self.minimumInteritemSpacing
            }
        }

        // Token should be on the same line as existing tokens
        if previousItemRect.maxX + self.minimumInteritemSpacing + currentItemRect.size.width < remainingLineWidth {
            currentItemRect.origin.x = previousItemRect.maxX + self.minimumInteritemSpacing
            currentItemRect.origin.y = previousItemRect.minY
            currentItemAttributes.frame = currentItemRect
            return currentItemAttributes
        }

        // Token exceeds the max length for the line, we need to create a new line of tokens
        currentItemRect.origin.x = sectionInset.left
        currentItemRect.origin.y = previousItemRect.maxY + self.minimumLineSpacing
        currentItemAttributes.frame = currentItemRect
        return currentItemAttributes
    }

    override open func layoutAttributesForDecorationView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if elementKind == searchIconDecorationCellType {
            let decorationLayoutAttributes = UICollectionViewLayoutAttributes(forDecorationViewOfKind: elementKind, with: indexPath)
            decorationLayoutAttributes.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            return decorationLayoutAttributes
        }
        return nil
    }

    open override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = self.collectionView else {
            return nil
        }

        var attributesCopy = [UICollectionViewLayoutAttributes]()

        if let decorationLayoutAttributes = self.layoutAttributesForDecorationView(ofKind: searchIconDecorationCellType, at: IndexPath(item: 0, section: 0)) {
            attributesCopy.append(decorationLayoutAttributes)
        }

        if let inheritedLayoutAttributesForElementsInRect = super.layoutAttributesForElements(in: rect) {
            for layoutAttributesForItemsInRect in inheritedLayoutAttributesForElementsInRect {
                if let layoutAttributesForItem = self.layoutAttributesForItem(at: layoutAttributesForItemsInRect.indexPath) {
                    if layoutAttributesForItem.frame.intersects(rect) {
                        attributesCopy.append(layoutAttributesForItem)
                    }
                }
            }
        }

        if let textInputFieldLayoutAttributes = attributesCopy.last {
            textInputFieldLayoutAttributes.frame.size = CGSize(width: collectionView.bounds.size.width - textInputFieldLayoutAttributes.frame.minX - self.sectionInset.right, height: textInputFieldLayoutAttributes.size.height)
            contentSize = CGSize(width: collectionView.bounds.width, height: textInputFieldLayoutAttributes.frame.maxY + self.sectionInset.bottom)
        }

        return attributesCopy
    }

    override open var collectionViewContentSize: CGSize {
        return contentSize
    }
    
    open override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
}
