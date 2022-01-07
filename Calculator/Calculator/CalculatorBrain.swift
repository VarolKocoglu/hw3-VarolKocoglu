//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Semih Emre ÜNLÜ on 26.12.2021.
//

import Foundation

class CalculatorBrain {
    //istenen işlemler + - * / bonus C CE =
    //standford university ios 9 > youtube video 1 ya da 2
    private var accumulator: Double = 0

    var result: Double {
        get {
            return accumulator
        }
    }
    

    //Selecting the operation which button is triggered by user
    func performOperation(_ operation: String?) {
        guard let operation = operation else { return }

        switch operation {
        case "+":
            executePendingBinaryOperation()
            pending = PendingBinaryOperationInfo(binaryFunction: ({$0 + $1}), firstOperand: accumulator)
        case "−":
            executePendingBinaryOperation()
            pending = PendingBinaryOperationInfo(binaryFunction: ({$0 - $1}), firstOperand: accumulator)
        case "÷":
            executePendingBinaryOperation()
            pending = PendingBinaryOperationInfo(binaryFunction: ({$0 / $1}), firstOperand: accumulator)
        case "×":
            executePendingBinaryOperation()
            pending = PendingBinaryOperationInfo(binaryFunction: ({$0 * $1}), firstOperand: accumulator)
        case "=":
            executePendingBinaryOperation()
        case "√":
            accumulator = sqrt(result)
        case "C":
            accumulator = 0
            pending = nil
        case "CE":
            accumulator = 0
        default:
            break
        }
    }

    //Setting private value
    func setOperand(_ value: Double) {
        accumulator = value
    }
    
    
    //When we get the second number then this operation triggers then we can find result
    private func executePendingBinaryOperation() {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    //This object use for waiting the second number
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var binaryFunction: (Double, Double) -> Double
        var firstOperand: Double
    }
}
