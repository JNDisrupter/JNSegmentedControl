//
//  JNSegmentedCollectionItemOptions.swift
//  JNSegmentedControl
//
//  Created by Medhat Ibsais on 03/08/2022.
//

import Foundation

/// JN Segmented Collection Item Option Type
public enum JNSegmentedCollectionItemOptionType {
    case single(option: JNSegmentedCollectionItemOptions) // Single option for all items
    case multiple(options: [JNSegmentedCollectionItemOptions]) // Multiple option for all items
}

/// JN Segmented Collection Item Options
public struct JNSegmentedCollectionItemOptions {
    
    /// Corner Radius
    var cornerRadius: CGFloat
    
    /// Background Color
    var backgroundColor: UIColor
    
    /// Selected Background Color
    var selectedBackgroundColor: UIColor
    
    /// Badge Background Color
    var badgeBackgroundColor: UIColor
    
    /// Selected Badge Background Color
    var selectedBadgeBackgroundColor: UIColor
    
    /// Badge Font
    var badgeFont: UIFont
    
    /// Selected Badge Font
    var selectedBadgeFont: UIFont
    
    /// Badge text color
    var badgeTextColor: UIColor
    
    /// Selected badge text color
    var selectedBadgeTextColor: UIColor
    
    /**
     Initializer
     */
    public init() {
        
        // Default values
        self.cornerRadius = 0.0
        self.backgroundColor = .clear
        self.selectedBackgroundColor = .clear
        self.badgeBackgroundColor = .clear
        self.selectedBadgeBackgroundColor = .clear
        self.badgeFont = UIFont.systemFont(ofSize: 15)
        self.selectedBadgeFont = UIFont.systemFont(ofSize: 15)
        self.badgeTextColor = .black
        self.selectedBadgeTextColor = .black
    }
    
    /**
     Initializer
     - Parameter cornerRadius: Radius to round the container view
     - Parameter backgroundColor: Normal state background color
     - Parameter selectedBackgroundColor: Selected state background color
     - Parameter badgeBackgroundColor: Normal state background color
     - Parameter selectedBadgeBackgroundColor: Selected state background color
     - Parameter badgeFont: Normal state font
     - Parameter selectedBadgeFont: Selected state font
     - Parameter badgeTextColor: Badge text color
     - Parameter selectedBadgeTextColor: Selected badge text color
     */
    public init(cornerRadius: CGFloat, backgroundColor: UIColor, selectedBackgroundColor: UIColor, badgeBackgroundColor: UIColor, selectedBadgeBackgroundColor: UIColor, badgeFont: UIFont, selectedBadgeFont: UIFont, badgeTextColor: UIColor, selectedBadgeTextColor: UIColor) {
        
        // Set values
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.badgeBackgroundColor = badgeBackgroundColor
        self.selectedBadgeBackgroundColor = selectedBadgeBackgroundColor
        self.badgeFont = badgeFont
        self.selectedBadgeFont = selectedBadgeFont
        self.badgeTextColor = badgeTextColor
        self.selectedBadgeTextColor = selectedBadgeTextColor
    }
}