//
//  JNSegmentedCollectionView.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

/// JNSegmentedCollectionView
public class JNSegmentedCollectionView: UIView {
    
    /// Collection View
    var collectionView: UICollectionView?
    
    /// Options
    var options = JNSegmentedCollectionOptions()
    
    /// Segmented Items
    var segmentedItems: [JNSegmentedControlCollectionViewCellRepresentable] = []
    
    /// Selected Segmented Items
    var selectedSegmentedItems: [JNSegmentedControlCollectionViewCellRepresentable] = []
    
    /// Items
    var items: [NSAttributedString] = []
    
    /// Selected Items
    var selectedItems: [NSAttributedString] = []
    
    /// Value Did Change
    public var valueDidChange: ((_ index: Int) -> Void)?
    
    /// Selected Index
    public var selectedIndex: Int = 0 {
        didSet {
            
            if selectedIndex != oldValue {
                
                // call closure for value did change
                self.valueDidChange?(selectedIndex)
                
                // update selected item
                self.updateSelectedItem()
                
                // build representables
                self.buildRepresentables()
                
                // scroll to selected item
                self.scrollToSelectedItem()
                
                // reload data
                self.collectionView?.reloadData()
            }
        }
    }
    
    /**
     Init with frame
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Init Sub Views
        self.initSubViews()
    }
    
    /**
     Init with NSCoder
     */
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Init Sub Views
        self.initSubViews()
    }
    
    /**
     Init view
     */
    private func initSubViews() {
        
        // Init colection view
        self.initCollectionView()
    }
    
    /**
     Init collection view
     */
    private func initCollectionView() {
        
        // Create flow layout
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets.zero
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0

        // Init collection view
        self.collectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.isPagingEnabled = false
        self.collectionView?.showsHorizontalScrollIndicator = false
        self.collectionView?.showsVerticalScrollIndicator = false
        self.collectionView?.bounces = true
        self.collectionView?.isScrollEnabled = true
        self.collectionView?.backgroundColor = .clear
        
        // Add collection view
        self.addSubview(self.collectionView!)
        
        // Register Cells
        JNSegmentedControlCollectionViewCell.registerCell(collectionView: self.collectionView!)
        JNSegmentedCollectionSupplementaryHeaderView.registerSupplementaryHeaderView(collectionView: self.collectionView!)
        
        // Add collection view constraints
        self.collectionView?.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView?.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.collectionView?.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.collectionView?.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.collectionView?.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    /**
     Setup view
     - parameter items : Array of attributed string
     - parameter options : JNSegmentedCollectionOptions
     */
    open func setup(items: [NSAttributedString], selectedItems: [NSAttributedString], options: JNSegmentedCollectionOptions?) {
        
        // Set Options
        if let options = options {
            self.options = options
            self.collectionView?.isScrollEnabled = options.isScrollEnabled
        }
        
        // set items
        self.items = items
        
        // set selected items
        self.selectedItems = selectedItems
        
        // Update Layout
        self.layoutIfNeeded()
        
        // build representables
        self.buildRepresentables()
        
        // reload data
        self.collectionView?.reloadData()
    }
    
    /**
     Build Representables
     */
    private func buildRepresentables() {
        
        // remove all items
        self.segmentedItems.removeAll()
        self.selectedSegmentedItems.removeAll()
        
        // Cell Size
        var cellSize: CGSize = CGSize.zero
        
        // Selected Cell Size
        var selectedCellSize: CGSize = CGSize.zero
        
        // Calculate cell size For Fixed Layout Type
        if case let JNSegmentedCollectionLayoutType.fixed(maxVisibleItems) = self.options.layoutType {
            let cellWidthForFixedLayoutType = self.getCellWidthForFixedLayoutType(maxVisibleItems: maxVisibleItems)
            
            // Update
            cellSize = CGSize(width: cellWidthForFixedLayoutType, height: self.frame.height)
            
            // Update
            selectedCellSize = cellSize
        }


        // Total Cells Width
        var totalCellsWidth: CGFloat = 0.0
        
        // Item Layout Margin
        let itemLayoutMargin = self.options.contentItemLayoutMargins * 2.0
        
        // Separator Width
        let separatorWidth = self.options.verticalSeparatorOptions?.width ?? 1.0
        
        // convert string attributed strings to array of representables
        for index in 0 ..< self.items.count {
            
            // init is selected / last items
            let isSelected = index == selectedIndex
            let isLastItem = index == self.items.count - 1
            
            let attrString = NSMutableAttributedString(attributedString: self.items[index])
            let selectedAttrString = NSMutableAttributedString(attributedString: self.selectedItems[index])
            
            // Add paragraph style to attributed string
            if !self.items[index].attributes(at: 0, effectiveRange: nil).keys.contains(NSAttributedString.Key.paragraphStyle) {
                
                let style = NSMutableParagraphStyle()
                style.alignment = NSTextAlignment.center
                style.lineSpacing = 5.0
                attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: attrString.length))
            }
            
            // Add paragraph style to selected attributed string
            if !self.selectedItems[index].attributes(at: 0, effectiveRange: nil).keys.contains(NSAttributedString.Key.paragraphStyle) {
                
                let style = NSMutableParagraphStyle()
                style.alignment = NSTextAlignment.center
                selectedAttrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: selectedAttrString.length))
            }
            
            
            
            if case JNSegmentedCollectionLayoutType.dynamic = self.options.layoutType {
                let cellWidth = JNSegmentedControlCollectionViewCell.calculateCellWidth(with: self.items[index], collectionViewHeight: self.collectionView?.frame.size.height ?? 0.0) + itemLayoutMargin
                
                let selectedCellWidth = JNSegmentedControlCollectionViewCell.calculateCellWidth(with: self.selectedItems[index], collectionViewHeight: self.collectionView?.frame.size.height ?? 0.0) + itemLayoutMargin
                
                // Update Total Cells Width
                totalCellsWidth += cellWidth
                
                // Add Separator width
                if index > 0 {
                   totalCellsWidth += separatorWidth
                }
                
                // Update Cell Size
                cellSize = CGSize(width: cellWidth, height: (self.collectionView?.frame.height ?? 0.0))
                selectedCellSize = CGSize(width: selectedCellWidth, height: (self.collectionView?.frame.height ?? 0.0))
            }

            
            // add representables
            self.segmentedItems.append(JNSegmentedControlCollectionViewCellRepresentable(attributedString: attrString, options: self.options, isLastItem: isLastItem, isSelected: isSelected, cellSize: cellSize))
            
            // add selected representables
            self.selectedSegmentedItems.append(JNSegmentedControlCollectionViewCellRepresentable(attributedString: selectedAttrString, options: self.options, isLastItem: isLastItem, isSelected: isSelected, cellSize: selectedCellSize))
        }
        
        // Collection width
        let collectionWidth = self.frame.size.width
        
        // Check in case of Dynamic mode and total cells width is less than collection view width
        if totalCellsWidth > 0.0 &&  totalCellsWidth < collectionWidth  {
            let newMargin = ((collectionWidth - totalCellsWidth) / CGFloat(self.segmentedItems.count))
            
            // Update cell size
            for item in self.segmentedItems {
                var cellSize = item.cellSize
                cellSize.width += newMargin
                
                // Update Represenatble
                item.updateCellSize(cellSize)
            }
        }
    }
    
    /**
     Update selected item
     */
    private func updateSelectedItem() {
        
        // set isSelected if (index == selectedIndex)
        for i in 0 ..< self.segmentedItems.count {
            self.segmentedItems[i].setIsSelected(i == self.selectedIndex)
        }
    }
    
    /**
     Scroll to selected item
     */
    private func scrollToSelectedItem() {
        
        guard self.selectedIndex != -1 else { return }
        self.collectionView?.scrollToItem(at: IndexPath(row: 0, section: self.selectedIndex), at: .centeredHorizontally, animated: true)
    }
}
