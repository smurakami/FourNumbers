//
//  Solver.swift
//  FourNumbers
//
//  Created by 村上晋太郎 on 2014/11/18.
//  Copyright (c) 2014年 村上晋太郎. All rights reserved.
//

import UIKit

enum NodeType {
    case op, num;
}

enum Operator: Printable {
    case add, sub, mul, div, none
    func exec(a: Int, b: Int) -> Int {
        switch self {
        case .add:
            return a + b
        case .sub:
            return a - b
        case .mul:
            return a * b
        case .div:
            return a / b
        default:
            return 0
        }
    }
    var description: String {
        switch self {
        case .add:
            return "+"
        case .sub:
            return "-"
        case .mul:
            return "*"
        case .div:
            return "/"
        default:
            return "none"
        }
        
    }
}

struct Node: Printable {
    var type: NodeType
    var num: Int
    var op: Operator
    var description: String {
        switch type {
        case .num:
            return String(num)
        case .op:
            return op.description
        }
    }
}

func numNode(num: Int) -> Node {
    return Node(type: .num, num: num, op: .none)
}

func opNode(op: Operator) -> Node {
    return Node(type: .op, num: 0, op: op);
}

class Solver {
    var numbers: [Int]
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    convenience init() {
        self.init(numbers:[7, 9, 8, 5])
    }
}

func solve(numbers: [Int]) {
    var nodeStack: [Node] = []
    var numStack: [Int] = []
    search(nodeStack: nodeStack, numStack: numStack, numbers:numbers)
}
func search(#nodeStack: [Node], #numStack: [Int], #numbers: [Int]) {
    func searchNum() {
        for var i = 0; i < numbers.count; i++ {
            var _numStack = numStack
            var _nodeStack = nodeStack
            var _numbers = numbers
            var n = _numbers.removeAtIndex(i)
            _numStack.append(n)
            _nodeStack.append(numNode(n))
            search(nodeStack: _nodeStack, numStack: _numStack, numbers: _numbers)
        }
    }
    func searchOp() {
        for op : Operator in [.add, .sub, .mul, .div] {
            var _numStack = numStack
            var _nodeStack = nodeStack
            var _numbers = numbers
            let a = _numStack.removeLast()
            let b = _numStack.removeLast()
            if op == .div {
                if a % b != 0 || b == 0 {
                    continue
                }
            }
            _numStack.append(op.exec(a, b:b))
            _nodeStack.append(opNode(op))
            search(nodeStack: _nodeStack, numStack: _numStack, numbers: _numbers)
        }
    }
    if numStack.count < 2 {
        if numbers.isEmpty { // 数字を使い切っていたら結果表示
            if (numStack[0] == 10) {
                println("\(numStack[0]): \(nodeStack)")
            }
        } else { // 数字をスタックに積む
            searchNum()
        }
    } else { // スタックに数字が複数積まれている場合
        searchNum() // 数字をスタックに積む
        searchOp()  // 演算子を適用する
    }
}