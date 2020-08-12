//
//  main.swift
//  Chapter01
//
//  Created by zhengzhilin on 2020/8/12.
//  Copyright © zhengzhilin. All rights reserved.
//

import Foundation

print("请输入第一个数字:")
let number1 = readLine()
print("请输入第二个数字:")
let number2 = readLine()
print("请输入操作符（+，-，*，/):")
let operate = readLine()
let operation = OperationFactory.createOperation(leftNum: Int(number1!)!, rightNum: Int(number2!)!, operate: operate!)
print("\(number1!+operate!+number2!)=\(operation.result())")


//工厂模式
class OperationFactory: NSObject {
    class func createOperation(leftNum: Int, rightNum: Int, operate: String) -> Operation {
        switch operate {
        case "+":
            return OperationAdd(leftNum: leftNum, rightNum: rightNum)
        case "-":
            return OperationSub(leftNum: leftNum, rightNum: rightNum)
        case "*":
            return OperationMul(leftNum: leftNum, rightNum: rightNum)
        case "/":
            return OperationDiv(leftNum: leftNum, rightNum: rightNum)
        default:
            break
        }
        return Operation(leftNum: leftNum, rightNum: rightNum)
    }
}

class Operation: NSObject {
    let leftNum: Int
    let rightNum: Int
    
    init(leftNum: Int, rightNum: Int) {
        self.leftNum = leftNum
        self.rightNum = rightNum
    }
    
    func result() -> Int {
        return 0
    }
}

class OperationAdd: Operation {
    override func result() -> Int {
        return leftNum + rightNum
    }
}

class OperationSub: Operation {
    override func result() -> Int {
        return leftNum - rightNum
    }
}

class OperationMul: Operation {
    override func result() -> Int {
        return leftNum * rightNum
    }
}

class OperationDiv: Operation {
    override func result() -> Int {
        return leftNum / rightNum
    }
}
