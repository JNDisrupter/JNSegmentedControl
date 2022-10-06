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
    
    /// Title container view corner radius
    private(set) var containerViewCornerRadius: CGFloat
    
    /// Title container view background color
    private(set) var containerViewBackgroundColor: UIColor
    
    /// Badge container view background color
    private(set) var badgeContainerViewBackgroundColor: UIColor
    
    /// Badge attributed string
    private(set) var badgeAttributedString: NSAttributedString?
    
    /// Badge container view width
    private(set) var badgeContainerViewWidth: CGFloat
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
        self.containerViewCornerRadius = 0.0
        self.containerViewBackgroundColor = .clear
        self.badgeContainerViewBackgroundColor = .clear
        self.badgeAttributedString = nil
        self.badgeContainerViewWidth = 0.0
    }
    
    /**
     Initialize
     */
    convenience init(attributedString: NSAttributedString, options: JNSegmentedCollectionOptions, isLastItem: Bool = false, isSelected: Bool = false, cellSize: CGSize = CGSize.zero, containerViewCornerRadius: CGFloat, containerViewBackgroundColor: UIColor, badgeContainerViewBackgroundColor: UIColor, badgeFont: UIFont, badgeCount: Int?, badgeTextColor: UIColor, badgeContainerViewWidth: CGFloat) {
        self.init()
        
        // build representable
        self.attributedString = attributedString
        self.options = options
        self.isLastItem = isLastItem
        self.isSelected = isSelected
        self.cellSize = cellSize
        self.containerViewCornerRadius = containerViewCornerRadius
        self.containerViewBackgroundColor = containerViewBackgroundColor
        self.badgeContainerViewBackgroundColor = badgeContainerViewBackgroundColor
        
        // set badge count
        if let badgeCount = badgeCount {
            
            // Set badge attributed string
            var badgeCountString = badgeCount.description
            
            if badgeCount > 99 {
                badgeCountString = "+99"
            }
            
            self.badgeAttributedString = NSAttributedString(string: badgeCountString, attributes: [NSAttributedString.Key.font: badgeFont, NSAttributedString.Key.foregroundColor: badgeTextColor])
            self.badgeContainerViewWidth = badgeContainerViewWidth
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
