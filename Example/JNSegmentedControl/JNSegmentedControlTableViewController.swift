//
//  JNSegmentedControlTableViewController.swift
//  JNSegmentedControl
//
//  Created by JNDisrupter on 11/29/2018.
//  Copyright (c) 2018 JNDisrupter. All rights reserved.
//

import UIKit

// JNSegmentedControlStyle
enum JNSegmentedControlStyle: Int {
    
    case textOnly          = 0
    case imageOnly
    case imageUnderLabel
    case imageAboveLabel
    case imageBeforeLabel
    case imageAfterLabel
    
    // Title
    var title: String {
        
        switch self {
        case .textOnly:
            return "Text Only"
        case .imageOnly:
            return "Image Only"
        case .imageUnderLabel:
            return "Image Under Label"
        case .imageAboveLabel:
            return "Image Above Label"
        case .imageBeforeLabel:
            return "Image Before Label"
        case .imageAfterLabel:
            return "Image After Label"
        }
    }
}

// JNSegmentedControlViewController
class JNSegmentedControlTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set navigation controller title
        self.navigationItem.title = "JN Segmented Control Styles"
    }
}

