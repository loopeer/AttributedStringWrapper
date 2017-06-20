# AttributedStringWrapper

![Xcode 8.3+](https://img.shields.io/badge/Xcode-8.3%2B-blue.svg)
![iOS 8.0+](https://img.shields.io/badge/iOS-8.0%2B-blue.svg)
![Swift 3.1+](https://img.shields.io/badge/Swift-3.0%2B-orange.svg)
[![Version](https://img.shields.io/cocoapods/v/AttributedStringWrapper.svg?style=flat)](https://cocoapods.org/pods/AttributedStringWrapper)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/loopeer/AttributedStringWrapper)
<a href="http://cocoapods.org/pods/AttributedStringWrapper"><img src="https://img.shields.io/cocoapods/at/AttributedStringWrapper.svg?label=Apps%20Using%20AttributedStringWrapper&colorB=28B9FE"></a>
<a href="http://cocoapods.org/pods/AttributedStringWrapper"><img src="https://img.shields.io/cocoapods/dt/AttributedStringWrapper.svg?label=Total%20Downloads&colorB=28B9FE"></a>

**AttributedStringWrapper** is a simple packaging for NSAttributedString to make the developers easy to use 


## Overview

**AttributedStringWrapper**  is base on String extension, converted into `RawRepresentable` protocal in order to solve the question of `Objective-C` namespace.
So it looks a bit strange, if you have a better way, please contact me



#### Before, you may like me

```swift
extension UILabel {
    convenience init(frame: CGRect = .zero, attributedText: String, textColor: UIColor, font: UIFont, lineSpacing: CGFloat) {
        self.init(frame: frame)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineBreakMode = .byTruncatingTail
        let attrStr = NSAttributedString(string: attributedText, attributes: [NSParagraphStyleAttributeName: paragraphStyle,
                                                                              NSFontAttributeName: font,
                                                                              NSForegroundColorAttributeName: textColor])
        self.attributedText = attrStr
    }
}

```


```
        let attr = NSMutableAttributedString(string: content)
        let paragrap = NSParagraphStyle()
        paragrap.lineSpacing = 8.0
        paragrap.alignment = .center
        attr.addAttributes([NSParagraphStyle: paragrap], range: NSMakeRange(0, attr.length))
        attr.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17)], range: NSMakeRange(0, attr.length))
        let shadow = NSShadow()
        shadow.shadowColor = UIColor.red
        shadow.shadowOffset = CGSize(width: 3, height: 3)
        shadow.shadowBlurRadius = 2.0
        attr.addAttributes([NSShadowAttributeName: NSShadow], range: NSMakeRange(0, attr.length))
        label6.attributedText = attr

```


#### After: 

```swift
// 1. shadow: you can set range, default allRange
label1.attributedText = content.toAttributed.shadow {
    $0.shadowColor = UIColor.red
    $0.shadowOffset = CGSize(width: 3, height: 3)
    $0.shadowBlurRadius = 2.0
}.rawValue


// 2. paragraphStyle: you can set range, default allRange

let attrText2 = content.toAttributed.paragraph {
    $0.alignment = .center
    $0.lineSpacing = 8.0
}.font(UIFont.systemFont(ofSize: 15))

label2.attributedText = attrText2.rawValue
print(attrText2.getHeight(by: screenW - 20))


// 3. underLine:  you can set range, default allRange
label3.attributedText = content.toAttributed.underLine(style: [.styleDouble, .patternDot], color: UIColor.red).rawValue

// 4. font, foregroundColor
textField.attributedPlaceholder = "Please enter the phone number".toAttributed.font(.systemFont(ofSize: 15))
                                                                 .foregroundColor(.red).rawValue

// 5. Even you can do it
label6.attributedText = content.toAttributed
            .underLine(style: [.styleSingle, .patternDot], color: .red, range: NSMakeRange(0, 5))
            .font(.systemFont(ofSize: 18), range: NSMakeRange(5, 5))
            .backgroundColor(.blue, range: NSMakeRange(10, 5))
            .foregroundColor(.purple, range: NSMakeRange(15, 5))
            .baselineOffset(value: 5, range: NSMakeRange(20, 5))
            .obliqueness(angle: 0.5, range: NSMakeRange(25, 5))
            .kern(padding: 0.3, range: NSMakeRange(30, 5))
            .expansion(value: 0.3, range: NSMakeRange(35, 5))
            .stroke(color: .green, width: 3, range: NSMakeRange(40, 5))
            .textEffect(range: NSMakeRange(50, 5))
            .shadow{
                $0.shadowColor = UIColor.red
                $0.shadowOffset = CGSize(width: 3, height: 3)
                $0.shadowBlurRadius = 2.0
            }.rawValue
```




## Installation


### 1. CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

Specify AttributedStringWrapper into your project's Podfile:


```ruby
# source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'
use_frameworks!

target '<Your App Target>' do
  pod 'AttributedStringWrapper'
end
```


Then run the following command:

```sh
$ pod install
```


### 2. Carthage

[Carthage](https://github.com/Carthage/Carthage) is a simple, decentralized
dependency manager for Cocoa.

Specify AttributedStringWrapper into your project's Carthage:


```
github "loopeer/AttributedStringWrapper" ~> 1.0.0

```
















