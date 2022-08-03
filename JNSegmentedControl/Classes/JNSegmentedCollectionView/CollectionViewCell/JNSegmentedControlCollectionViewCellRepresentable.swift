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
    
    /// Attributed String
    private(set) var attributedString: NSAttributedString
    
    /// Options
    private(set) var options: JNSegmentedCollectionOptions
    
    /// Is Last Item
    private(set) var isLastItem: Bool
    
    /// Is Selected
    private(set) var isSelected: Bool = false
    
    /// Cell Size
    private(set) var cellSize: CGSize
    
    /// Title Label Container View Corner Radius
    private(set) var titleLabelContainerViewCornerRadius: CGFloat
    
    /// Title Label Container View Background Color
    private(set) var titleLabelContainerViewBackgroundColor: UIColor
    
    /// Badge Container View Background Color
    private(set) var badgeContainerViewBackgroundColor: UIColor
    
    /// Badge Font
    private(set) var badgeFont: UIFont
    
    /// Badge Count
    private(set) var badgeCount: Int?
    
    /**
     Initializer
     */
    init() {
        
        // Set default values
        self.attributedString = NSAttributedString()
        self.options = JNSegmentedCollectionOptions()
        self.isLastItem = false
        self.isSelected = false
        self.cellSize = CGSize.zero
        self.titleLabelContainerViewCornerRadius = 0.0
        self.titleLabelContainerViewBackgroundColor = .clear
        self.badgeContainerViewBackgroundColor = .clear
        self.badgeFont = UIFont()
    }
    
    /**
     Initialize
     */
    convenience init(attributedString: NSAttributedString, options: JNSegmentedCollectionOptions, isLastItem: Bool = false, isSelected: Bool = false, cellSize: CGSize = CGSize.zero, titleLabelContainerViewCornerRadius: CGFloat, titleLabelContainerViewBackgroundColor: UIColor, badgeContainerViewBackgroundColor: UIColor, badgeFont: UIFont, badgeCount: Int?) {
        self.init()
        
        // build representable
        self.attributedString = attributedString
        self.options = options
        self.isLastItem = isLastItem
        self.isSelected = isSelected
        self.cellSize = cellSize
        self.titleLabelContainerViewCornerRadius = titleLabelContainerViewCornerRadius
        self.titleLabelContainerViewBackgroundColor = titleLabelContainerViewBackgroundColor
        self.badgeContainerViewBackgroundColor = badgeContainerViewBackgroundColor
        self.badgeFont = badgeFont
        self.badgeCount = badgeCount
    }
    
    /**
     Set Is Selected
     - Parameter isSelected: Is Selected Value
     */
    func setIsSelected(_ isSelected: Bool) {
        
        // Set Is Selected
        self.isSelected = isSelected
    }
    
    /**
     Update Cell Size
     - Parameter isSelected: Is Selected Value
     */
    func updateCellSize(_ newSize: CGSize) {
        self.cellSize = newSize
    }
}
