//
//  ViewController.swift
//  NewCalculator
//
//  Created by Alexander Person on 1/16/16.
//  Copyright © 2016 Alexander Person. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingANumber = false

    
    @IBAction func appendDigit(sender: UIButton) {
        
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            userIsInTheMiddleOfTypingANumber = true
            display.text = digit
        }
        
    }

    var operandStack: Array<Double> = Array<Double>()
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        print("OperandStack = \(operandStack)")
        
    }
    
    var displayValue: Double {
        get {
            
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func operate(sender: UIButton) {
        
    }
}

