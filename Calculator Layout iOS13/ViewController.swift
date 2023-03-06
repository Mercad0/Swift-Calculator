/*
  ViewController.swift
  Calculator Layout iOS13

  Created by Angela Yu on 01/07/2019.
  Copyright © 2019 The App Brewery. All rights reserved.
*/

import UIKit

class ViewController: UIViewController {
    
    /* currently ONLY Handling Ints.. Unable to Figure out how to add the ( . ) Inplementation without adding extra bugs..
     TOTAL  Window :) */
    @IBOutlet weak var total: UILabel!
    var currentNumber: Int = 0
    var firstNumb: Int = 0
    var secondNumb: Int = 0
    var operation: String = ""
    
    // Here we set the Numbers that are tapped
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        currentNumber = currentNumber * 10 + Int(digit)!
        total.text = String(currentNumber)
    }
    
    // this handles where any operator types button are pressed (
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        guard let op = sender.titleLabel?.text else { return }
        firstNumb = Int(total.text!)!
        currentNumber = 0
        operation = op
    }
    
    // Here we join first & second number between operator button pressed
    @IBAction func equalButtonTapped(_ sender: UIButton) {
        secondNumb = Int(total.text!)!
        currentNumber = 0
        var result: Int = 0
        switch operation {
        case "+":
            result = firstNumb + secondNumb
        case "-":
            result = firstNumb - secondNumb
        case "*":
            result = firstNumb * secondNumb
        case "/":
            result = firstNumb / secondNumb
        default:
            break
        }
        total.text = String(result)
        currentNumber = result
        operation = ""
    }
    
    // we know what clear is..
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        currentNumber = 0
        firstNumb = 0
        secondNumb = 0
        operation = ""
        total.text = "0"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}

