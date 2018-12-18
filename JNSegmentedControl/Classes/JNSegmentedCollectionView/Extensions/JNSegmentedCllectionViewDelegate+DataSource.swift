//
//  JNSegmentedCllectionViewDelegate+DataSource.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/28/18.
//  Copyright © 2018 JNDisrupter. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewDelegate+DataSource
extension JNSegmentedCollectionView: UICollectionViewDelegate ,UICollectionViewDataSource {
    
    /**
     Number of items in section
     */
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.segmentedItems.count
    }
    
    /**
     Cell for item at index path
     */
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Get segmented collection cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JNSegmentedControlCollectionViewCell.getReuseIdentifier(), for: indexPath) as? JNSegmentedControlCollectionViewCell
        
        // Set up cell
        let representable = indexPath.section == selectedIndex ? self.selectedSegmentedItems[indexPath.section]
            : self.segmentedItems[indexPath.section]
        cell!.setup(with: representable)
        
        return cell!
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // set selected index
        self.selectedIndex = indexPath.section
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension JNSegmentedCollectionView: UICollectionViewDelegateFlowLayout {
    
    /**
     Size For Item At
     */
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.calculateWidth(for: indexPath), height: self.collectionView?.frame.height ?? 0.0)
    }
    
    /**
     Calculate Width.
     - Parameter indexPath: IndexPath
     - Returns with: calculated width CGFloat value
     */
    public func calculateWidth(for indexPath: IndexPath) -> CGFloat {
        
        guard let collectionView = self.collectionView else { return 0.0 }
        let collectionViewWidth = collectionView.frame.width
        
        switch self.options.layoutType {
        case .fixed(let maxVisibleItems):
            let maxItems = maxVisibleItems > self.segmentedItems.count ? self.segmentedItems.count : maxVisibleItems
            let totalSeparatorWidth = CGFloat(self.segmentedItems.count) * (self.options.verticalSeparatorOptions?.width ?? 1.0)
            let cellWidth = maxItems == 0 ? 0 : floor((collectionViewWidth  - totalSeparatorWidth) / CGFloat(maxItems))
            return cellWidth
        case .dynamic:
            
            // Item Layout Margin
            let itemLayoutMargin = self.options.contentItemLayoutMargins * 2.0
            
            var dynamicWidth: CGFloat = 0
            for item in self.segmentedItems {
                dynamicWidth += JNSegmentedControlCollectionViewCell.calculateCellWidth(with: item, collectionViewHeight: self.collectionView?.frame.size.height ?? 0.0) + itemLayoutMargin
            }
            let itemWidth = JNSegmentedControlCollectionViewCell.calculateCellWidth(with: self.segmentedItems[indexPath.section], collectionViewHeight: self.collectionView?.frame.size.height ?? 0.0) +  itemLayoutMargin
            
            let width = dynamicWidth > collectionViewWidth ? itemWidth
                : itemWidth + ((collectionViewWidth - dynamicWidth) / CGFloat(self.segmentedItems.count))
            
            return width
        }
    }
    
    /**
     View For Supplementary Element Of Kind.
     */
    public func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // Header view kind
        if kind == UICollectionView.elementKindSectionHeader {
            
            // Dequeue reusable supplementary view
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: JNSegmentedCollectionSupplementaryHeaderView.getReuseIdentifier(), for: indexPath) as? JNSegmentedCollectionSupplementaryHeaderView
                else { return UICollectionReusableView() }
            
            if indexPath.section == 0 {
                headerView.setupView(options: nil, collectionViewHeight: self.collectionView?.frame.height ??  0)
            }else{
                headerView.setupView(options: self.options.verticalSeparatorOptions, collectionViewHeight: self.collectionView?.frame.height ??  0)
            }
          
            return headerView
            
        }else{
            
            return UICollectionReusableView()
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
           return CGSize(width: 0.0, height: collectionView.frame.height)
        }else{
             return CGSize(width: self.options.verticalSeparatorOptions?.width ?? 0.0, height: collectionView.frame.height)
        }
    }
}
