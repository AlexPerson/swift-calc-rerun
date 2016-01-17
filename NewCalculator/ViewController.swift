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
        let operation = sender.currentTitle!
        if userIsInTheMiddleOfTypingANumber {
            enter()
        }
        
        switch operation {
        case "×": performOperation { $0 * $1 }
        case "÷": performOperation { $1 / $0 }
        case "+": performOperation { $0 + $1 }
        case "−": performOperation { $1 - $0 }
        case "√": performOtherOperation { sqrt($0) }
        default: break
        }
    }
    
    func performOperation(operation: (Double, Double) ->Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOtherOperation(operation: Double -> Double) {
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}

