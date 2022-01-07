//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet var digitButtons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private var userIsTyping = false

    private var brain = CalculatorBrain()

    var result: Double {
        get {
            return Double(resultLabel.text ?? "0.0") ?? 0.0
        }
        set {
            resultLabel.text = String(newValue)
        }
    }

    //When user clicks digits this function triggers
    @IBAction func digitButtonTapped(_ sender: UIButton) {
        if userIsTyping {
            var resultText = String(Int(result))
            resultText = resultText + String(sender.tag)
            result = NSString(string: resultText).doubleValue
        } else {
            result = Double(sender.tag)
        }
            userIsTyping = true
    }

    //When user clicks operation button this function triggers
    @IBAction func operationButtonTapped(_ sender: UIButton) {
        if userIsTyping {
            brain.setOperand(result)
            userIsTyping = false
        }
        if let symbol = sender.titleLabel?.text {
            brain.performOperation(symbol)
            result = 0
        }
        result = brain.result
        //brain.performOperation(sender.titleLabel?.text ?? "")

    }
}

