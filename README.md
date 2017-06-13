# AttributedStringWrapper

![Xcode 8.2+]([https://img.shields.io/badge/Xcode-8.2%2B-blue.svg](https://img.shields.io/badge/Xcode-8.2%2B-blue.svg))

![iOS 8.0+]([https://img.shields.io/badge/iOS-8.0%2B-blue.svg](https://img.shields.io/badge/iOS-8.0%2B-blue.svg))

![Swift 3.0+]([https://img.shields.io/badge/Swift-3.0%2B-orange.svg](https://img.shields.io/badge/Swift-3.0%2B-orange.svg))

![Version]([https://img.shields.io/cocoapods/v/AlertTransition.svg?style=flat](https://img.shields.io/cocoapods/v/AlertTransition.svg?style=flat))](https://cocoapods.org/pods/AlertTransition)

**AttributedStringWrapper** is a simple packaging for NSAttributedString to make the developers easy to use 



## Overview

**AttributedStringWrapper**  is base on String extension, converted into `RawRepresentable` protocal in order to solve the question of `Object-C` namespace.
So it looks a bit strange, if you have a better way, please contact me



### Before, you may like me

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



#### After:

```swift
// 1. shadow: you can set range, default allRange
label1.attributedText = content.toAttributed.shadow {
            $0.shadowColor = UIColor.red
            $0.shadowOffset = CGSize(width: 3, height: 3)
            $0.shadowBlurRadius = 2.0
}.rawValue


// 2. paragraphStyle: you can set range, default allRange
label2.attributedText = content.toAttributed.paragraph {
    $0.alignment = .center
    $0.lineSpacing = 8.0
}.rawValue


// 3. underLine:  you can set range, default allRange
label3.attributedText = content.toAttributed.underLine(style: [.styleDouble, .patternDot], color: UIColor.red).rawValue

// 4. font, foregroundColor
textField.attributedPlaceholder = "Please enter the phone number"                							.toAttributed.font(.systemFont(ofSize: 15))
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



















