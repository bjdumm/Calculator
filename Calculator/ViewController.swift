//
//  ViewController.swift
//  Calculator
//
//  Created by Brennan Dumm on 2/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    var operationActive: Bool = false
    var oldValue: Float = 0
    var function: String = ""
    var canAddDecimal: Bool = true
    
    @IBOutlet var currentValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   
    
    @IBAction func numberTapped(_ sender: UIButton) {
        let val = sender.titleLabel?.text! //Display this in label
        let current = currentValue.text
        
        if val == "." {
            if canAddDecimal {
                if !operationActive {
                    currentValue.text? += val!
                    self.canAddDecimal = false
                } else {
                    currentValue.text? = val!
                    self.canAddDecimal = false
                    operationActive = false
                }
            }
        }
        
        else if currentValue.text == "0" && !operationActive {
            currentValue.text = val!
        } else if !operationActive && val != "." {
            currentValue.text? += val!
        } else {
            currentValue.text = val!
            operationActive = false
        }
    }
    
    
    @IBAction func operandTapped(_ sender: UIButton) {
        switch sender.titleLabel?.text {
            case "/":
                print("Dividing")
                oldValue = Float(currentValue.text!)!
                function = "/"
                operationActive = true
                canAddDecimal = true
            case "x":
                print("Multiplying")
                oldValue = Float(currentValue.text!)!
                function = "x"
                operationActive = true
                canAddDecimal = true
            case "-":
                print("Subtracting")
                oldValue = Float(currentValue.text!)!
                function = "-"
                operationActive = true
                canAddDecimal = true
            case "+":
                print("Adding")
                oldValue = Float(currentValue.text!)!
                function = "+"
                operationActive = true
                canAddDecimal = true
                
            default:
                print("Doing Nothing")
        }
    }
    
    
    @IBAction func compute(_ sender: UIButton) {
        switch function {
        case "+":
            let add = Float(currentValue.text!)!
            let sum = add + oldValue
            currentValue.text = String(sum)
            function = ""
            canAddDecimal = true
        case "-":
            let sub = Float(currentValue.text!)!
            let diff = oldValue - sub
            currentValue.text = String(diff)
            function = ""
            canAddDecimal = true
        case "x":
            let mult = Float(currentValue.text!)!
            let product = mult * oldValue
            currentValue.text = String(product)
            function = ""
            canAddDecimal = true
        case "/":
            let num = Float(currentValue.text!)!
            let result = oldValue / num
            currentValue.text = String(result)
            function = ""
            canAddDecimal = true
        default:
            break
        }
        
    }
    
    @IBAction func clearTapped(_ sender: UIButton) {
        currentValue.text = "0"
    }
    
}

