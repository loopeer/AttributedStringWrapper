//
//  ViewController.swift
//  Demo
//
//  Created by 郜宇 on 2017/6/13.
//  Copyright © 2017年 Loopeer. All rights reserved.
//

import UIKit
import AttributedStringWrapper

let screenW = UIScreen.main.bounds.width


class ViewController: UIViewController {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let content = "A view controller is tightly bound to the views it manages and takes part in the responder chain used to handle events."
        
        
        // 1. shadow: you can set range, default allRange
        let attrText1 = content.toAttributed.shadow {
            $0.shadowColor = UIColor.red
            $0.shadowOffset = CGSize(width: 3, height: 3)
            $0.shadowBlurRadius = 2.0
        }.font(UIFont.systemFont(ofSize: 15))
        
        label1.attributedText = attrText1.rawValue
        // Add the shadow offset
        print(attrText1.getHeight(by: screenW - 20) + 3)
        
        
        
        // 2. paragraphStyle: you can set range, default allRange
        let attrText2 = content.toAttributed.paragraph {
            $0.alignment = .center
            $0.lineSpacing = 8.0
        }.font(UIFont.systemFont(ofSize: 15))
        label2.attributedText = attrText2.rawValue
        print(attrText2.getHeight(by: screenW - 20))
        
        
        
        // 3. underLine:  you can set range, default allRange
        label3.attributedText = content.toAttributed.underLine(style: [.styleDouble, .patternDot], color: UIColor.red).rawValue
        
        
        
        // 4. strikethrough: you can set range, default allRange
        label4.attributedText = content.toAttributed.strikethrough(style: [.styleDouble, .patternDot], color: UIColor.red, range: NSMakeRange(0, 10)).rawValue
        
        
        
        // 5. strokeStyle:
        label5.attributedText = content.toAttributed.stroke(color: UIColor.blue, width: 2.5).rawValue
        
        
        // 6. all:
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
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("label1 height: \(label1.frame.height)")
        print("label2 height: \(label2.frame.height)")
    }
    
}





