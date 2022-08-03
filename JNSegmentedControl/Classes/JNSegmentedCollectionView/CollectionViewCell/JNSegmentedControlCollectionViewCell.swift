//
//  JNSegmentedControlCollectionViewCell.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// Component Values
private struct ComponentValues {
    static let badgeCountLabelMargins: CGFloat                  = 2.0
    static let badgeCountLabelContainerViewTrailing: CGFloat    = 5.0
}

/// JNSegmentedControlCollectionViewCell
class JNSegmentedControlCollectionViewCell: UICollectionViewCell {
    
    /// Title Label Container View
    @IBOutlet private weak var titleLabelContainerView: UIView!
    
    /// Title Label
    @IBOutlet private weak var titleLabel: UILabel!
    
    /// Badge Count Container View
    @IBOutlet private weak var badgeCountContainerView: UIView!
    
    /// Badge Count Label
    @IBOutlet private weak var badgeCountLabel: UILabel!
    
    /// Badge Count Label Container View Trailing Constraint
    @IBOutlet private weak var badgeCountLabelContainerViewTrailingConstraint: NSLayoutConstraint!
    
    /// Badge Count Label Top Constraint
    @IBOutlet private weak var badgeCountLabelTopConstraint: NSLayoutConstraint!
    
    /// Badge Count Label Leading Constraint
    @IBOutlet private weak var badgeCountLabelLeadingConstraint: NSLayoutConstraint!
    
    /// Badge Count Label Bottom Constraint
    @IBOutlet private weak var badgeCountLabelBottomConstraint: NSLayoutConstraint!
    
    /// Badge Count Label Trailing Constraint
    @IBOutlet private weak var badgeCountLabelTrailingConstraint: NSLayoutConstraint!
    
    /**
     Awake From Nib
     */
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // clear background color
        self.backgroundColor = UIColor.clear
    }
    
    /**
     Prepare for reuse
     */
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    /**
     Setup
     - Parameter representable: The Segmented Control Collection View Cell Representable object
     */
    func setup(with representable: JNSegmentedControlCollectionViewCellRepresentable) {
        
        // set title number of lines
        self.titleLabel.numberOfLines = 0
        
        // Set title label
        self.titleLabel.attributedText = representable.attributedString
        self.titleLabel.minimumScaleFactor = 0.3
        self.titleLabel.adjustsFontSizeToFitWidth = true
        
        // Set background colors
        self.titleLabelContainerView.backgroundColor = representable.titleLabelContainerViewBackgroundColor
        self.badgeCountContainerView.backgroundColor = representable.badgeContainerViewBackgroundColor
        
        // Set font
        self.badgeCountLabel.font = representable.badgeFont
        
        // Get badge count
        if let badgeCount = representable.badgeCount {
            
            // Set text
            self.badgeCountLabel.text = " \(badgeCount) "
            
            // Set constraints to default value
            self.badgeCountLabelTopConstraint.constant = ComponentValues.badgeCountLabelMargins
            self.badgeCountLabelBottomConstraint.constant = ComponentValues.badgeCountLabelMargins
            self.badgeCountLabelLeadingConstraint.constant = ComponentValues.badgeCountLabelMargins
            self.badgeCountLabelTrailingConstraint.constant = ComponentValues.badgeCountLabelMargins
            self.badgeCountLabelContainerViewTrailingConstraint.constant = ComponentValues.badgeCountLabelContainerViewTrailing
        }
        else {
            
            // Remove the text
            self.badgeCountLabel.text = nil
            
            // Set constraints to zero
            self.badgeCountLabelContainerViewTrailingConstraint.constant = 0
            self.badgeCountLabelTopConstraint.constant = 0
            self.badgeCountLabelBottomConstraint.constant = 0
            self.badgeCountLabelLeadingConstraint.constant = 0
            self.badgeCountLabelTrailingConstraint.constant = 0
        }
        
        // Layout the view before applying the corner radius
        self.layoutIfNeeded()
        
        // Circle badge count container view
        self.badgeCountContainerView.clipsToBounds = true
        self.badgeCountContainerView.layer.cornerRadius = self.badgeCountContainerView.bounds.size.height / 2
        
        // Setup badge count container view corner radius
        self.titleLabelContainerView.clipsToBounds = true
        self.titleLabelContainerView.layer.cornerRadius = representable.titleLabelContainerViewCornerRadius
    }
    
    
    
    // MARK: - Class methods
    
    /**
     Get cell reuse identifier
     - Returns : Cell reuse identifier
     */
    class func getReuseIdentifier() -> String {
        return "JNSegmentedControlCollectionViewCell"
    }
    
    /**
     Register cell
     - parameter collectionView: Collection View
     */
    class func registerCell(collectionView:UICollectionView) {
        
        collectionView.register(UINib(nibName: "JNSegmentedControlCollectionViewCell", bundle: Bundle(for: JNSegmentedControlCollectionViewCell.self)), forCellWithReuseIdentifier: JNSegmentedControlCollectionViewCell.getReuseIdentifier())
    }
    
    /**
     Calculate Cell Width
     - Parameter attributedString: Attributed String.
     - Returns: the calculated width, CGFloat value.
     */
    class func calculateCellWidth(with attributedString: NSAttributedString, collectionViewHeight: CGFloat) -> CGFloat {
        let size = attributedString.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude , height: collectionViewHeight), options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil)
        return size.width
    }
}
