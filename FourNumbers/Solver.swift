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
    func solve(numbers: [Int]) {
        var stack: [Node] = [];
        self.search(stack: stack, numbers:numbers);
    }
    func search(#stack: [Node], numbers: [Int]) {
//        println(stack)
        func searchNum() {
            for var i = 0; i < numbers.count; i++ {
                var _stack = stack
                var _numbers = numbers;
                var n = _numbers.removeAtIndex(i)
                _stack.append(numNode(n))
                self.search(stack: _stack, numbers: _numbers);
            }
        }
        func searchOp() {
            for op : Operator in [.add, .sub, .mul, .div] {
                var _stack = stack
                var _numbers = numbers;
                let a = _stack.removeLast()
                let b = _stack.removeLast()
                if b.num == 0 && op == .div {
                    continue
                }
                _stack.append(numNode(op.exec(a.num, b:b.num)))
                search(stack: _stack, numbers: _numbers)
            }
        }
        if stack.count < 2 {
            searchNum()
            if numbers.isEmpty {
                println(stack[0])
            }
        } else {
            searchNum()
            searchOp()
        }
    }
}
