//
//  Solver.swift
//  FourNumbers
//
//  Created by 村上晋太郎 on 2014/11/18.
//  Copyright (c) 2014年 村上晋太郎. All rights reserved.
//

import UIKit

enum NodeType {
    case op, num, none
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
//            println("\(a) \(b)")
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
    var type: NodeType = .none
    var num: Int = 0
    var op: Operator = .none
    var description: String {
        switch type {
        case .num:
            return String(num)
        case .op:
            return op.description
        default:
            return ""
        }
    }
}

class Solver {
    let numbers: [Int]
    let target: Int
    var answer: String
    init(numbers: [Int], target: Int) {
        self.target = target
        self.numbers = numbers
        self.answer = ""
    }
    
    func expr(nodes: [Node]) -> String {
        var stack: [String] = []
        for node in nodes {
            switch node.type {
            case .num:
                stack.append(node.description)
            case .op:
                var b = stack.removeLast()
                var a = stack.removeLast()
                stack.append("(\(a) \(node.op.description) \(b))")
            default:
                break
            }
        }
        return stack[0]
    }
    
    func numNode(num: Int) -> Node {
        var node : Node = Node()
        node.type = .num
        node.num = num
        return node
    }
    
    func opNode(op: Operator) -> Node {
        var node : Node = Node()
        node.type = .op
        node.op   = op
        return node
    }
    
    func solve() {
        var nodeStack: [Node] = []
        var numStack: [Int] = []
        search(nodeStack: nodeStack, numStack: numStack, numbers:numbers)
    }
    
    func search(#nodeStack: [Node], numStack: [Int], numbers: [Int]) -> Bool {
        func searchNum() -> Bool {
            for var i = 0; i < numbers.count; i++ {
                var _numStack = numStack
                var _nodeStack = nodeStack
                var _numbers = numbers
                var n = _numbers.removeAtIndex(i)
                _numStack.append(n)
                _nodeStack.append(numNode(n))
                let finished = search(nodeStack: _nodeStack, numStack: _numStack, numbers: _numbers)
                if finished {
                    return true
                }
            }
            return false
        }
        func searchOp() -> Bool {
            for op : Operator in [.add, .sub, .mul, .div] {
                var _numStack = numStack
                var _nodeStack = nodeStack
                var _numbers = numbers
                let b = _numStack.removeLast()
                let a = _numStack.removeLast()
                if op == .div {
                    if b == 0 || a % b != 0 {
                        continue
                    }
                }
                _numStack.append(op.exec(a, b:b))
                _nodeStack.append(opNode(op))
                let finished = search(nodeStack: _nodeStack, numStack: _numStack, numbers: _numbers)
                if finished {
                    return true
                }
            }
            return false
        }
        if numStack.count < 2 {
            if numbers.isEmpty { // 数字を使い切っていたら結果表示
                if (numStack[0] == 10) {
                    self.answer = expr(nodeStack)
                    return true// 一つ答えが見つかったら打ち切り
                }
            } else { // 数字をスタックに積む
                let finished = searchNum()
                if finished { return true }
            }
        } else { // スタックに数字が複数積まれている場合
            var finished = searchNum()
            if finished { return true }
            finished = searchOp()  // 演算子を適用する
            if finished { return true }
        }
        return false
    }
}

