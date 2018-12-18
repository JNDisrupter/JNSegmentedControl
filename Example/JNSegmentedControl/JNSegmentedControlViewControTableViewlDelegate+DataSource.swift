//
//  JNSegmentedControlViewControTableViewlDelegate+DataSource.swift
//  JNSegmentedControl_Example
//
//  Created by JNDisrupter on 11/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

// MARK: - UITableViewDelegate
extension JNSegmentedControlTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showSegmentedControl", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let sender = sender as? Int, let style = JNSegmentedControlStyle(rawValue: sender)
            else { return }
        
        if segue.identifier == "showSegmentedControl" {
            
            if let destinationVC = segue.destination as? JNSegmentedControlDetailViewController {
                destinationVC.segmentedStyle = style
            }
        }
    }
}
