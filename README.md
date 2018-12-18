# JNSegmentedControl

[![CI Status](https://img.shields.io/travis/ihmouda/JNSegmentedControl.svg?style=flat)](https://travis-ci.org/ihmouda/JNSegmentedControl)
[![Version](https://img.shields.io/cocoapods/v/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)
[![License](https://img.shields.io/cocoapods/l/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)
[![Platform](https://img.shields.io/cocoapods/p/JNSegmentedControl.svg?style=flat)](https://cocoapods.org/pods/JNSegmentedControl)


**JNSegmentedControl** is an easy to use, animated segmented control for iOS written in Swift.  
**JNSegmentedControl** supports 3 main styles of segments: text only, image only, text with image on (under, above, before and after text).


## Preview

<img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/JNSegmentedControl1.gif" width="280"/>  
<img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/JNSegmentedControl2.gif" width="280"/>
<img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/JNSegmentedControl3.gif" width="280"/>
<img src="https://github.com/JNDisrupter/JNSegmentedControl/raw/master/Images/JNSegmentedControl4.gif" width="280"/>

## Requirements:

- Xcode 9
- iOS 8.x+
- Swift 4.0+


## Installation

JNSegmentedControl is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JNSegmentedControl'
```

## Usage:

- Import **JNSegmentedControl module**
```swift
import JNSegmentedControl
```

- **Initalization:**
- **Storyboard:**
Manually, you can add a UIView instance to your Xib, set **'JNSegmentedControl'** class and connect @IBOutlet reference.

- **Programmatically:**
Init ‘JNSegmentedControl’ UIView instance programatically.

```swift
let segmentedControlView = JNSegmentedCollectionView()
self.view.addSubview(segmentedControlView)
```

-  **Setup:**
- **JNSegmentedControl Setup:**

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

- **Configuring items:**
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

```swift
JNSegmentedCollectionOptions(
backgroundColor: UIColor.white,
position: JNSegmentedCollectionPosition.dynamic, 
verticalSeparatorOptions: JNSegmentedCollectionItemVerticalSeparatorOptions? = nil,
scrollEnabled: true,
numberOfLines: 0
)
```

```swift
enum  JNSegmentedCollectionPosition {
case dynamic
case fixed(maxVisibleItems: Int)
}
```

```swift
JNSegmentedCollectionItemVerticalSeparatorOptions (
ratio: 0.3, 
color: UIColor.red
)
```

- **Parameters:**

- **backgroundColor**: Segmented Control Background Color.
- **position**: case value from JNSegmentedCollectionPosition enumeration.
- **verticalSeparatorOption**s: instance from JNSegmentedCollectionItemVerticalSeparatorOptions struct as vertical separator between segments.
- **scrollEnabled**: segmented control is scrolling enabled.
- **numberOfLines**: number of lines ( 0 for automatic height / 1+ for specified number of lines).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

- **Example As Text Only Style:**

```swift
let items = ["Area Chart", "Bar Chart", "Line Chart", "Pie Chart", "Area Chart”]
var attributedStringItems: [NSAttributedString] = []
var selectedAttributedStringItems: [NSAttributedString] = []
let defaultAttributes = [NSAttributedStringKey.font: UIFont(name: "OpenSans", size: 12) ?? UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:  UIColor.black]
let selectedAttributes = [NSAttributedStringKey.font: UIFont(name: "OpenSans", size: 12) ?? UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor:  UIColor.blue]

for item in self.items {

// Default Attributed String
let defaultAttributedString = NSAttributedString(string: item, attributes: defaultAttributes)
attributedStringItems.append(defaultAttributedString)

// Selected Attributed string
let selectedAttributedString = NSAttributedString(string: item, attributes: selectedAttributes)
selectedAttributedStringItems.append(selectedAttributedString)
}

let verticalSeparatorOptions = JNSegmentedCollectionItemVerticalSeparatorOptions (
ratio: 0.3,
color: UIColor.red
)

let options = JNSegmentedCollectionOptions(
backgroundColor: .clear,
position: JNSegmentedCollectionPosition.dynamic,
verticalSeparatorOptions: verticalSeparatorOptions,
scrollEnabled: true,
numberOfLines: 0
)

self.segmentedControlView.setup(
items: self.attributedStringItems,
selectedItems: self.selectedAttributedStringItems,
options: options
}
```


- **Example As Text With ي Style:**
Image position to label (under / above / after / before) is adjusted via the combination of (string and image attachment) using the **NSMutableAttributedString()**:


```swift

let titleString = “Title"
let imageAttachment = NSTextAttachment()
let fullString = NSMutableAttributedString()

//  image under label
fullString.append(NSAttributedString(string))
fullString.append(NSAttributedString("\n”))
fullString.append.append(NSAttributedString(attachment: selectedImageAttachment))

//  image above label
fullString.append(NSAttributedString(attachment: selectedImageAttachment))
fullString.append(NSAttributedString("\n”))
fullString.append(NSAttributedString(string))

//  image after label
fullString.append(NSAttributedString(string))
fullString.append(NSAttributedString(“ ”))
fullString.append(NSAttributedString(attachment: selectedImageAttachment))

//  image before label
fullString.append(NSAttributedString(attachment: selectedImageAttachment))
fullString.append(NSAttributedString(“ ”))
fullString.append(NSAttributedString(string))    
```

## Author

Jayel Zaghmoutt, Mohammad Nabulsi & Mohammad Ihmouda

## License

JNSegmentedControl is available under the MIT license. See the [LICENSE](https://github.com/JNDisrupter/JNSegmentedControl/blob/master/LICENSE) file for more info.
