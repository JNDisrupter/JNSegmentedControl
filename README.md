# JNSegmentedControl

[![CI Status](https://img.shields.io/travis/ihmouda/JNSegmentedControl.svg?style=flat)](https://travis-ci.org/JNDisrupter/JNSegmentedControl)
[![Version](https://img.shields.io/cocoapods/v/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)
[![License](https://img.shields.io/cocoapods/l/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)


**JNSegmentedControl** is an easy to use, animated segmented control for iOS written in Swift.  
**JNSegmentedControl** supports 3 main styles of segments: text only, image only, text with image on (under, above, before and after text).


## Preview

<img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/TextOnly.gif" width="280"/>  <img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/ImageOnly.gif" width="280"/> <img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/ImageUnderLabel.gif" width="280"/> <img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/LabelUnderImage.gif" width="280"/> <img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/ImageBeforeLabel.gif" width="280"/>

## Requirements:

- Xcode 9
- iOS 9.0+
- Swift 4.2+


## Installation

JNSegmentedControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```swift
pod 'JNSegmentedControl'
```

## Usage:

- Import **JNSegmentedControl module**
```swift
import JNSegmentedControl
```

- **Initalization:**
    - ***Storyboard:***
    Manually, you can add a UIView instance to your Xib, set **'JNSegmentedControl'** class and connect @IBOutlet reference.

    - ***Programmatically:***
    Init ‘JNSegmentedControl’ UIView instance programatically.

    ```swift
        let segmentedControlView = JNSegmentedCollectionView()
        self.view.addSubview(segmentedControlView)
    ```

-  **Setup:**
    - ***JNSegmentedControl Setup:***

    ```swift
        self.segmentedControlView.setup(
            items: [NSAttributedString],
            selectedItems: [NSAttributedString],
            options: JNSegmentedCollectionOptions()
        )
    ```
    
    To start with default options you can pass **(nil)** value to the options parameter.

    ```swift
        self.segmentedControlView.setup(
            items: [NSAttributedString],
            selectedItems: [NSAttributedString],
            options: nil
        )
    ```

    - ***Configuring items:***
    
    The Segmented Control items & selected items are array of **NSAttributedString**. In order to set items you need to provide an instance of **[NSAttributedString]**.

    - ***Default Items:***
        ```swift
                var items = [NSAttributedString]()
                let item  = NSAttributedString(string: “Default Item", attributes: [])
                items.append(item)
        ```

    - ***Selected Items:***
        ```swift
            var items = [NSAttributedString]()
            let item  = NSAttributedString(string: “Selected Item", attributes: [])
            items.append(item)
        ```

- **Handling callback:**

    ```swift
        self.segmentedControlView.valueDidChange = { segment in
            print("Selected item: ", segment)
        }
    ```

- **Options Customization:**

    - **backgroundColor**: Segmented control background color.
    - **layoutType**: case value from **JNSegmentedCollectionLayoutType** enumeration.
    - **verticalSeparatorOption**s: instance from **JNSegmentedCollectionItemVerticalSeparatorOptions** struct as vertical separator between segments.
    - **scrollEnabled**: segmented control is scrolling enabled.
    - **contentItemLayoutMargins**: Content item layout margins from Left and Right.

    ```swift
        JNSegmentedCollectionOptions(
            backgroundColor: UIColor.white,
            layoutType: JNSegmentedCollectionLayoutType.dynamic, 
            verticalSeparatorOptions: JNSegmentedCollectionItemVerticalSeparatorOptions? = nil,
            scrollEnabled: true,
            contentItemLayoutMargins: 10.0
        )
    ```

- ***JNSegmented Collection Layout Type:***
    
    The Segmented Control has two types of layout for items:
  
     - **Dynamic:** The width of each item will be according to its content.
     - **Fixed:** The width of each item will be fixed according to max  visible Items.
    
    ```swift
        enum  JNSegmentedCollectionLayoutType {
            case dynamic
            case fixed(maxVisibleItems: Int)
        }
    ```
- ***JNSegmented Vertical Separator Options:***

    The Segmented Control has the ability to show separator line between items, that has the following settings:

    -  **HeigthRatio:**  Separator view height Ratio accroding to collection view height, max value is 1 and min is 0.
    -  **Width:** Separator view width.
    -  **Color:** Separator view background color.
    
    ```swift
        JNSegmentedCollectionItemVerticalSeparatorOptions (
            heigthRatio: 0.3, 
            width: 1.0,
            color: UIColor.blue
        )
    ```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Author

Jayel Zaghmoutt, Mohammad Nabulsi & Mohammad Ihmouda

## License

JNSegmentedControl is available under the MIT license. See the [LICENSE](https://github.com/JNDisrupter/JNSegmentedControl/blob/master/LICENSE) file for more info.
