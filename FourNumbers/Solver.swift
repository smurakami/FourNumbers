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

enum Operator {
    case add, sub, mul, div
}

struct Node {
    var num: Int
    var type: NodeType
    var op: Operator
}

class Solver {
    var numbers: [Int]
    init(numbers: [Int]) {
        self.numbers = numbers
    }
    convenience init() {
        self.init(numbers:[1,2,3,4])
    }
    func solve(numbers: [Int]) {
        print(numbers);
        
    }
    func search(stack: [Node], numbers: [Int]) {
        
    }
}
