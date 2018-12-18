//
//  JNSegmentedControlCollectionViewCellRepresentable.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// JNSegmentedControlCollectionViewCellRepresentable
class JNSegmentedControlCollectionViewCellRepresentable {
    
    /// Cell height
    var cellHeight: CGFloat
    
    /// Cell reuse identifier
    var cellReuseIdentifier: String
    
    /// Is loading
    var isLoading: Bool
    
    /// Item Data Index
    var itemDataIndex: Int
    
    /// Selector Type
    var selectorType: String
    
    /// Attributed String
    private(set) var attributedString: NSAttributedString
    
    /// Options
    private(set) var options: JNSegmentedCollectionOptions
    
    /// Is Last Item
    private(set) var isLastItem: Bool
    
    /// Is Selected
    private(set) var isSelected: Bool = false
    
    /// Attributed String
    private(set) var collectionViewSize: CGSize
    
    /**
     Initializer
     */
    init() {
        
        // Set default values
        self.cellHeight = 0.0
        self.cellReuseIdentifier = JNSegmentedControlCollectionViewCell.getReuseIdentifier()
        self.isLoading = false
        self.itemDataIndex = -1
        self.selectorType = ""
        self.attributedString = NSAttributedString()
        self.options = JNSegmentedCollectionOptions()
        self.isLastItem = false
        self.isSelected = false
        self.collectionViewSize = CGSize.zero
    }
    
    /**
     Initialize
     - Parameter title: Title String
     */
    convenience init(attributedString: NSAttributedString, options: JNSegmentedCollectionOptions, isLastItem: Bool = false, isSelected: Bool = false, collectionViewSize: CGSize = CGSize.zero) {
        self.init()
        
        // build representable
        self.attributedString = attributedString
        self.options = options
        self.isLastItem = isLastItem
        self.isSelected = isSelected
        self.collectionViewSize = collectionViewSize
    }
    
    /**
     Set Is Selected
     - Parameter isSelected: Is Selected Value
     */
    func setIsSelected(_ isSelected: Bool) {
        
        // Set Is Selected
        self.isSelected = isSelected
    }
}
