//
//  AttributedStringWrapper.swift
//  AttributedStringWrapper
//
//  Created by 郜宇 on 2017/6/13.
//  Copyright © 2017年 Loopeer. All rights reserved.
//

import Foundation

public extension String {
    var toAttributed: AttributedStringWrapper {
        return AttributedStringWrapper(rawValue: NSMutableAttributedString(string: self))
    }
}

public struct AttributedStringWrapper: RawRepresentable {
    public typealias RawValue = NSMutableAttributedString
    public var rawValue: NSMutableAttributedString
    public init(rawValue: AttributedStringWrapper.RawValue) {
        self.rawValue = rawValue
    }
}

public extension AttributedStringWrapper {
    
    typealias ParagraphStyleSetup = (NSMutableParagraphStyle) -> Void
    typealias ShadowStyleSetup = (NSShadow) -> Void
    
    @available(iOS 9.0, *)
    typealias WriteDirection = (formatType: NSWritingDirectionFormatType, direction: NSWritingDirection)
    
    var allRange: NSRange {
        return NSMakeRange(0, self.rawValue.length)
    }
    
    /// NSParagraphStyleAttributeName(段落)
    @discardableResult
    func paragraph(range: NSRange? = nil, setup: ParagraphStyleSetup) -> AttributedStringWrapper {
        let paragraphStyle = NSMutableParagraphStyle()
        setup(paragraphStyle)
        rawValue.addAttributes([NSParagraphStyleAttributeName: paragraphStyle],
                               range: range ?? allRange)
        return self
    }
    
    /// NSForegroundColorAttributeName(字体颜色)
    @discardableResult
    func foregroundColor(_ color: UIColor, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSForegroundColorAttributeName: color],
                               range: range ?? allRange)
        return self
    }
    
    /// NSFontAttributeName(字体)
    @discardableResult
    func font(_ font: UIFont, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSFontAttributeName: font],
                               range: range ?? allRange)
        return self
    }
    /// NSBackgroundColorAttributeName(字体背景色)
    @discardableResult
    func backgroundColor(_ color: UIColor, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSBackgroundColorAttributeName: color],
                               range: range ?? allRange)
        return self
    }
    
    /// NSStrikethroughStyleAttributeName(删除线)
    @discardableResult
    func strikethrough(style: [NSUnderlineStyle],
                       color: UIColor? = nil,
                       range: NSRange? = nil) -> AttributedStringWrapper {
        // iOS10.3 bugs: https://stackoverflow.com/questions/43070335/nsstrikethroughstyleattributename-how-to-strike-out-the-string-in-ios-10-3
        rawValue.addAttributes([NSStrikethroughStyleAttributeName: style.reduce(0) { $0 | $1.rawValue }, NSBaselineOffsetAttributeName: 0], range: range ?? allRange)
        guard let color = color else { return self }
        rawValue.addAttributes([NSStrikethroughColorAttributeName: color], range: range ?? allRange)
        return self
    }
    
    /// NSUnderlineStyleAttributeName(下划线)
    @discardableResult
    func underLine(style: [NSUnderlineStyle],
                   color: UIColor? = nil,
                   range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSUnderlineStyleAttributeName: style.reduce(0) { $0 | $1.rawValue }], range: range ?? allRange)
        guard let color = color else { return self }
        rawValue.addAttributes([NSUnderlineColorAttributeName: color], range: range ?? allRange)
        return self
    }
    
    /// NSShadowAttributeName(阴影)
    @discardableResult
    func shadow(range: NSRange? = nil, setup: ShadowStyleSetup) -> AttributedStringWrapper {
        let shadow = NSShadow()
        setup(shadow)
        rawValue.addAttributes([NSShadowAttributeName: shadow], range: range ?? allRange)
        return self
    }
    
    /// NSObliquenessAttributeName 设置字形倾斜度,正值右倾，负值左倾
    @discardableResult
    func obliqueness(angle: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSObliquenessAttributeName: angle], range: range ?? allRange)
        return self
    }
    
    /// NSWritingDirectionAttributeName 设置文字书写方向，从左向右书写或者从右向左书写
    @available(iOS 9.0, *)
    @discardableResult
    func writingDirection(write: WriteDirection, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSWritingDirectionAttributeName: [write.direction.rawValue | write.formatType.rawValue]], range: range ?? allRange)
        return self
    }
    
    /// 空心字 颜色, 线宽
    @discardableResult
    func stroke(color: UIColor, width: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSStrokeColorAttributeName: color], range: range ?? allRange)
        rawValue.addAttributes([NSStrokeWidthAttributeName: width], range: range ?? allRange)
        return self
    }
    
    /// NSKernAttributeName 文字间的间距
    @discardableResult
    func kern(padding: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSKernAttributeName: padding], range: range ?? allRange)
        return self
    }
    
    /// NSExpansionAttributeName 拉伸压缩  正值横向拉伸 负值横向压缩
    @discardableResult
    func expansion(value: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSExpansionAttributeName: value], range: range ?? allRange)
        return self
    }
    
    /// NSLigatureAttributeName 连体 0 表示没有连体字符。1 表示使用默认的连体字符。2表示使用所有连体符号。默认值为 1（注意，iOS 不支持值为 2）
    @discardableResult
    func ligature(value: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSLigatureAttributeName: value], range: range ?? allRange)
        return self
    }
    
    /// NSBaselineOffsetAttributeName 基线偏移量  正值上偏 负值下偏
    @discardableResult
    func baselineOffset(value: CGFloat, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSBaselineOffsetAttributeName: value], range: range ?? allRange)
        return self
    }
    
    /// NSTextEffectAttributeName 特殊效果 目前只有NSTextEffectLetterpressStyle(凸版印刷效果)可用
    @discardableResult
    func textEffect(value: String = NSTextEffectLetterpressStyle, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSTextEffectAttributeName: value], range: range ?? allRange)
        return self
    }
    
    /// NSVerticalGlyphFormAttributeName 横、竖排版  0横向排版 1竖向排版
    @discardableResult
    func verticalGlyphForm(value: Int, range: NSRange? = nil) -> AttributedStringWrapper {
        rawValue.addAttributes([NSVerticalGlyphFormAttributeName: value], range: range ?? allRange)
        return self
    }
    
    /// get height
    func getHeight(by fixedWidth: CGFloat) -> CGFloat {
        let h = rawValue.boundingRect(with: CGSize(width: fixedWidth, height: CGFloat(MAXFLOAT)), options: [.usesFontLeading , .usesLineFragmentOrigin, .usesDeviceMetrics], context: nil).size.height
        return ceil(h)
    }
    /// get width
    func getWidth(by fixedHeight: CGFloat) -> CGFloat {
        let w = rawValue.boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: fixedHeight), options: [.usesFontLeading , .usesLineFragmentOrigin], context: nil).size.width
        return ceil(w)
    }
}






