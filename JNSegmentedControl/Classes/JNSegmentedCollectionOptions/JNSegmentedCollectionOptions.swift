//
//  JNSegmentedCollectionOptions.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// JNSegemntedControl Color
public enum JNSegemntedControlColor: String {
    
    case blue
    
    // Get Color
    public func getColor(alpha: CGFloat) -> UIColor {
        switch self {
        case .blue:
            return UIColor(red:0 , green: 118, blue: 192, alpha: alpha)
        }
    }
}

/// JNSegmented Collection Item Vertical Separator Options
public struct JNSegmentedCollectionItemVerticalSeparatorOptions {
    
    /// Height Ratio accroding to collection view height, max value is 1 and min is 0
    var heigthRatio: CGFloat
    
    /// Vertical Seperator Width
    var width: CGFloat
    
    /// Color
    var color: UIColor
    
    /**
     Initializer
     */
    public init(heigthRatio: CGFloat = 1.0, width: CGFloat = 1.0, color: UIColor = JNSegemntedControlColor.blue.getColor(alpha: 1.0)) {
        
        // Set Height Ratio
        if heigthRatio < 0.0 {
            self.heigthRatio = 0.0
        }else if heigthRatio > 1.0 {
          self.heigthRatio = 1.0
        }else{
            self.heigthRatio = heigthRatio
        }
        
        // Set Width
        self.width = width
        
        // Set Color
        self.color = color
    }
}

/// JNSegmentedCollectionLayoutType
public enum JNSegmentedCollectionLayoutType {
    
    /// Dynamic
    case dynamic
    
    /// Fixed (Max Visible Items)
    case fixed(maxVisibleItems: Int)
}

/// JNSegmentedCollectionOptions
public struct JNSegmentedCollectionOptions {
    
    /// Background Color
    var backgroundColor: UIColor
    
    /// Layout Type
    var layoutType: JNSegmentedCollectionLayoutType
    
    /// Vertical Separator Options
    var verticalSeparatorOptions: JNSegmentedCollectionItemVerticalSeparatorOptions?
    
    /// Is Scroll Enable
    var isScrollEnabled: Bool
    
    /// Content Item Layout Margins
    var contentItemLayoutMargins: CGFloat
    
    /**
     Initializer
     */
    init() {
        self.backgroundColor = .clear
        self.layoutType = JNSegmentedCollectionLayoutType.dynamic
        self.verticalSeparatorOptions = nil
        self.isScrollEnabled = true
        self.contentItemLayoutMargins = 30.0
    }
    
    /**
     Initializer
     */
    public init(backgroundColor: UIColor, layoutType: JNSegmentedCollectionLayoutType, verticalSeparatorOptions: JNSegmentedCollectionItemVerticalSeparatorOptions? = nil, scrollEnabled: Bool = true, contentItemLayoutMargins: CGFloat = 30.0 ) {
        
        self.layoutType = layoutType
        self.backgroundColor = backgroundColor
        self.verticalSeparatorOptions = verticalSeparatorOptions
        self.isScrollEnabled = scrollEnabled
        self.contentItemLayoutMargins = contentItemLayoutMargins
    }
}
