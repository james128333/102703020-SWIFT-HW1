//
//  DisplayLabel.swift
//  Calculator
//
//  Created by sodas on 2/28/16.
//  Copyright © 2016 sodas. All rights reserved.
//

import UIKit

class DisplayLabel: UILabel {

    // MARK: - Value
    
    var floatValue: Float {
        get {
            if let text = self.text {
                return Float(text)!
            } else {
                return 0.0
            }
        }
        set(newValue) {
            self.text = (newValue as NSNumber).stringValue
        }
    }

    func clear() {
        compare = true
        self.floatValue = 0.0
        }

    func append(digit: Int) {
        if let text = self.text where text != "0" {
            self.text = text + "\(digit)"
        } else {
            self.text = (digit as NSNumber).stringValue
        }
    }

    // MARK: - Negative
    
    var compare: Bool = true
    
    func percen(){
        self.floatValue = self.floatValue/100
        compare = false
    }
    

    var negative: Bool {
    return self.text?.hasPrefix("-") ?? false
    }
    
    func changeSign() {
        if self.floatValue != 0.0{
        guard let text = self.text else {
            return
        }
        self.text = self.negative ? text.substringFromIndex(text.startIndex.advancedBy(1)) : "-" + text
    }
    }

    func adddigit(){
        if let text = self.text{
        if compare == true{
        self.text = text + "."
        compare = false
        }
        }
    }
    
}
