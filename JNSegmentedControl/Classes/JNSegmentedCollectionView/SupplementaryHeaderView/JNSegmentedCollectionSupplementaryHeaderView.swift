//
//  JNSegmentedCollectionSupplementaryHeaderView.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// JNSegmentedCollectionSupplementaryHeaderView
public class JNSegmentedCollectionSupplementaryHeaderView: UICollectionReusableView {
    
    /**
     Init with frame
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
     Init with NSCoder
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     Setup View
     - parameter options: Vertical Separator Options.
     - parameter collectionViewHeight: Collection View Height.
     */
    public func setupView(options: JNSegmentedCollectionItemVerticalSeparatorOptions?, collectionViewHeight: CGFloat) {
        
        let headerHeight =  CGFloat(options?.heigthRatio ?? 0.0) * collectionViewHeight
        let yOffset = (collectionViewHeight - headerHeight) / 2
        
        self.bounds = CGRect(x: self.bounds.origin.x, y: yOffset, width: options?.width ?? 0.0, height: headerHeight)
        self.backgroundColor = options?.color ?? UIColor.clear
    }
    
    // MARK: - Class methods
    
    /**
     Get cell reuse identifier
     - Returns : Cell reuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "JNSegmentedCollectionSupplementaryHeaderView"
    }
    
    /**
     Register Supplementary Header View
     - parameter collectionView: Collection View
     */
    class func registerSupplementaryHeaderView(collectionView:UICollectionView) {
        
        collectionView.register(JNSegmentedCollectionSupplementaryHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: JNSegmentedCollectionSupplementaryHeaderView.getReuseIdentifier())
    }
}

