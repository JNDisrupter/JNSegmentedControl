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
    
    /// Attributed string
    private(set) var attributedString: NSAttributedString
    
    /// Options
    private(set) var options: JNSegmentedCollectionOptions
    
    /// Is last item
    private(set) var isLastItem: Bool
    
    /// Is selected
    private(set) var isSelected: Bool = false
    
    /// Cell size
    private(set) var cellSize: CGSize
    
    /// Title label container view corner radius
    private(set) var titleLabelContainerViewCornerRadius: CGFloat
    
    /// Title label container view background color
    private(set) var titleLabelContainerViewBackgroundColor: UIColor
    
    /// Badge container view background color
    private(set) var badgeContainerViewBackgroundColor: UIColor
    
    /// Badge attributed string
    private(set) var badgeAttributedString: NSAttributedString?
    
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
        self.badgeAttributedString = nil
    }
    
    /**
     Initialize
     */
    convenience init(attributedString: NSAttributedString, options: JNSegmentedCollectionOptions, isLastItem: Bool = false, isSelected: Bool = false, cellSize: CGSize = CGSize.zero, titleLabelContainerViewCornerRadius: CGFloat, titleLabelContainerViewBackgroundColor: UIColor, badgeContainerViewBackgroundColor: UIColor, badgeFont: UIFont, badgeCount: Int?, badgeTextColor: UIColor) {
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
        
        // set badge count
        if let badgeCount = badgeCount {
            
            // Set badge attributed string
            var badgeCountString = badgeCount.description
            
            if badgeCount > 99 {
                badgeCountString = "+99"
            }
            
            self.badgeAttributedString = NSAttributedString(string: badgeCountString, attributes: [NSAttributedString.Key.font: badgeFont, NSAttributedString.Key.foregroundColor: badgeTextColor])
        }
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
