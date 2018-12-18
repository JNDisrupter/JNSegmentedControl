//
//  JNSegmentedControlDetailViewController.swift
//  JNSegmentedControl_Example
//
//  Created by JNDisrupter on 11/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import JNSegmentedControl

// JNSegmentedControlDetailViewController
class JNSegmentedControlDetailViewController: UIViewController {
    
    /// selected segmented style
    @IBOutlet weak var selectedSegmentedStyle: UILabel!
    
    /// Segmented Control View
    @IBOutlet weak var segmentedControlView: JNSegmentedCollectionView!

    /// Segmented Style
    var segmentedStyle: JNSegmentedControlStyle = JNSegmentedControlStyle.textOnly

    /// Text Array
    let textArray = ["Area Chart", "Bar Chart", "Line Chart", "Pie Chart", "Area Chart"]
    
    /// Image Array
    let imageArray = ["AreaChart", "BarChart", "LineChart", "PieChart", "AreaChart"]
    
    /// Selected Images Array
    let selectedImageArray = ["SelectedAreaChart", "SelectedBarChart", "SelectedLineChart", "SelectedPieChart", "SelectedAreaChart"]

    // array of attributed items
    var attributedStringItems: [NSAttributedString] = []
    var selectedAttributedStringItems: [NSAttributedString] = []
    
    // default attributes
    var defaultAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.black]
    
    // selected attributes
    var selectedAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor(red: CGFloat(0), green: CGFloat(118.0/255.0), blue: CGFloat(192/255.0), alpha: CGFloat(1.0))]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // show segmented control view
        self.showSegmentedControlView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set navigation controller title
        self.navigationItem.title = self.segmentedStyle.title
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // listen to changing the status
        self.segmentedControlView.valueDidChange = { segmentIndex in
            self.selectedSegmentedStyle.text = "\(segmentIndex + 1)"
        }
    }
    
    // showSegmentedControlView
    func showSegmentedControlView(){
        
        // setup segmented collection view
        switch self.segmentedStyle {
        case .textOnly:
            self.setupTextOnlySegmentedCollectionView()
        case .imageOnly:
            self.setupImageOnlySegmentedCollectionView()
        case .imageUnderLabel:
            self.setupImageUnderLabelSegmentedCollectionView()
        case .imageAboveLabel:
            self.setupImageAboveLabelSegmentedCollectionView()
        case .imageBeforeLabel:
            self.setupImageBeforeLabelSegmentedCollectionView()
        case .imageAfterLabel:
            self.setupImageAfterLabelSegmentedCollectionView()
        }
        
        // define vertical separator options
        let verticalSeparatorOptions = JNSegmentedCollectionItemVerticalSeparatorOptions(heigthRatio: 0.3, width: 1.0 ,color: UIColor(red: CGFloat(0), green: CGFloat(118.0/255.0), blue: CGFloat(192/255.0), alpha: CGFloat(1.0)))
        
        // define options
        let options = JNSegmentedCollectionOptions(backgroundColor: .clear, position: JNSegmentedCollectionLayoutType.dynamic, verticalSeparatorOptions: verticalSeparatorOptions, scrollEnabled: true)
        
        // setup collection view
        self.segmentedControlView.setup(items: self.attributedStringItems, selectedItems: self.selectedAttributedStringItems, options: options)
    }
    
    // MARK: - Build Segmented Styles
    private func setupTextOnlySegmentedCollectionView(){

        // convert strings to attributed string
        for item in self.textArray {
            
            // Default Attributed String
            let defaultAttributedString = NSAttributedString(string: item, attributes: defaultAttributes)
            attributedStringItems.append(defaultAttributedString)
            
            // Selected Attributed string
            let selectedAttributedString = NSAttributedString(string: item, attributes: selectedAttributes)
            selectedAttributedStringItems.append(selectedAttributedString)
        }
    }
    
    // setupImageOnlySegmentedCollectionView
    private func setupImageOnlySegmentedCollectionView(){
        
        // iterate through image name array items
        for index in 0 ..< self.imageArray.count {
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: self.imageArray[index])
            imageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 40, height: 40))
            self.attributedStringItems.append(NSAttributedString(attachment: imageAttachment))
            
            let selectedImageAttachment = NSTextAttachment()
            selectedImageAttachment.image = UIImage(named: self.selectedImageArray[index])
            selectedImageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 40, height: 40))
            self.selectedAttributedStringItems.append(NSAttributedString(attachment: selectedImageAttachment))
        }
    }
    
    // setupImageUnderLabelSegmentedCollectionView
    private func setupImageUnderLabelSegmentedCollectionView(){

        // convert strings to attributed string
        for index in 0 ..< self.textArray.count {

            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            style.lineSpacing = 5.0
            
            let fullString = NSMutableAttributedString()

            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: self.imageArray[index])
            imageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
            
            fullString.append(NSAttributedString(string: self.textArray[index], attributes: defaultAttributes))
            fullString.append(NSAttributedString(string: "\n"))
            fullString.append(NSAttributedString(attachment: imageAttachment))
            fullString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: fullString.length))
            
            self.attributedStringItems.append(fullString)

            let selectedFullString = NSMutableAttributedString()
            
            let selectedImageAttachment = NSTextAttachment()
            selectedImageAttachment.image = UIImage(named: self.selectedImageArray[index])
            selectedImageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
            
            selectedFullString.append(NSAttributedString(string: self.textArray[index], attributes: selectedAttributes))
            selectedFullString.append(NSAttributedString(string: "\n"))
            selectedFullString.append(NSAttributedString(attachment: selectedImageAttachment))
            
            selectedFullString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: selectedFullString.length))
            self.selectedAttributedStringItems.append(selectedFullString)
        }
    }
 
    // setupImageAboveLabelSegmentedCollectionView
    private func setupImageAboveLabelSegmentedCollectionView(){

        // convert strings to attributed string
        for index in 0 ..< self.textArray.count {
            
            let style = NSMutableParagraphStyle()
            style.alignment = NSTextAlignment.center
            style.lineSpacing = 5.0
            
            let fullString = NSMutableAttributedString()
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: self.imageArray[index])
            imageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
            
            fullString.append(NSAttributedString(attachment: imageAttachment))
            fullString.append(NSAttributedString(string: "\n"))
            fullString.append(NSAttributedString(string: self.textArray[index], attributes: defaultAttributes))
            fullString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: fullString.length))
            
            self.attributedStringItems.append(fullString)
            
            let selectedFullString = NSMutableAttributedString()
            
            let selectedImageAttachment = NSTextAttachment()
            selectedImageAttachment.image = UIImage(named: self.selectedImageArray[index])
            selectedImageAttachment.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: 20, height: 20))
            
            selectedFullString.append(NSAttributedString(attachment: selectedImageAttachment))
            selectedFullString.append(NSAttributedString(string: "\n"))
            selectedFullString.append(NSAttributedString(string: self.textArray[index], attributes: selectedAttributes))
            selectedFullString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSRange(location: 0, length: selectedFullString.length))
            
            self.selectedAttributedStringItems.append(selectedFullString)
        }
    }

    // setupImageBeforeLabelSegmentedCollectionView
    private func setupImageBeforeLabelSegmentedCollectionView(){

        // convert strings to attributed string
        for index in 0 ..< self.textArray.count {
            
            let fullString = NSMutableAttributedString()
            
            // Image Width And Height
            let imageWidthHeight: CGFloat = 25.0
            
            // Attachment Y Position
            let attachmentYPosition =  (UIFont.systemFont(ofSize: 16).capHeight - imageWidthHeight).rounded() / 2
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: self.imageArray[index])
            imageAttachment.bounds = CGRect(origin: CGPoint(x: 0.0, y: attachmentYPosition), size: CGSize(width: imageWidthHeight, height: imageWidthHeight))
            
            fullString.append(NSAttributedString(attachment: imageAttachment))
            fullString.append(NSAttributedString(string: "  "))
            fullString.append(NSAttributedString(string: self.textArray[index], attributes: defaultAttributes))
            
            self.attributedStringItems.append(fullString)
            
            let selectedFullString = NSMutableAttributedString()
            
            let selectedImageAttachment = NSTextAttachment()
            selectedImageAttachment.image = UIImage(named: self.selectedImageArray[index])
            selectedImageAttachment.bounds = CGRect(origin: CGPoint(x: 0.0, y: attachmentYPosition), size: CGSize(width: imageWidthHeight, height: imageWidthHeight))
            
            selectedFullString.append(NSAttributedString(attachment: selectedImageAttachment))
            selectedFullString.append(NSAttributedString(string: "  "))
            selectedFullString.append(NSAttributedString(string: self.textArray[index], attributes: selectedAttributes))
            
            self.selectedAttributedStringItems.append(selectedFullString)
        }
    }

    // setupImageAfterLabelSegmentedCollectionView
    private func setupImageAfterLabelSegmentedCollectionView(){

        // convert strings to attributed string
        for index in 0 ..< self.textArray.count {
            
            // Image Width And Height
            let imageWidthHeight: CGFloat = 25.0
            
            // Attachment Y Position
            let attachmentYPosition =  (UIFont.systemFont(ofSize: 16).capHeight - imageWidthHeight).rounded() / 2
            
            let fullString = NSMutableAttributedString()
            
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named: self.imageArray[index])
            imageAttachment.bounds = CGRect(origin: CGPoint(x: 0.0, y: attachmentYPosition), size: CGSize(width: imageWidthHeight, height: imageWidthHeight))
            
            fullString.append(NSAttributedString(string: self.textArray[index], attributes: defaultAttributes))
            fullString.append(NSAttributedString(string: "  "))
            fullString.append(NSAttributedString(attachment: imageAttachment))
            
            self.attributedStringItems.append(fullString)
            
            let selectedFullString = NSMutableAttributedString()
            
            let selectedImageAttachment = NSTextAttachment()
            selectedImageAttachment.image = UIImage(named: self.selectedImageArray[index])
            selectedImageAttachment.bounds = CGRect(origin: CGPoint(x: 0.0, y: attachmentYPosition), size: CGSize(width: imageWidthHeight, height: imageWidthHeight))
            
            selectedFullString.append(NSAttributedString(string: self.textArray[index], attributes: selectedAttributes))
            selectedFullString.append(NSAttributedString(string: "  "))
            selectedFullString.append(NSAttributedString(attachment: selectedImageAttachment))
            
            self.selectedAttributedStringItems.append(selectedFullString)
        }
    }
}
