//
//  JNSegmentedControlCollectionViewCell.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// JNSegmentedControlCollectionViewCell
class JNSegmentedControlCollectionViewCell: UICollectionViewCell {
    
    /// Title Label
    @IBOutlet private weak var titleLabel: UILabel!
    
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
