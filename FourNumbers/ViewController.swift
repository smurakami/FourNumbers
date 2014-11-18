//
//  ViewController.swift
//  FourNumbers
//
//  Created by 村上晋太郎 on 2014/11/18.
//  Copyright (c) 2014年 村上晋太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var exprLabel: UILabel!
    
    var numbers: [Int] = []
    var target: Int = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = ""
        exprLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addNum(num: Int) {
        self.numbers.append(num)
        var str = " "
        for n in self.numbers {
            str += "\(n) "
        }
        self.numLabel.text = str
    }
    
    func delNum() {
        self.numbers = []
        self.numLabel.text = ""
    }
    
    func solve() {
        var s = Solver(numbers: self.numbers, target: 10);
        s.solve()
        if (s.answer != "") {
            exprLabel.text = "\(s.target) = \(s.answer)"
        } else {
            exprLabel.text = "\(s.target) = (can not solve)"
        }
    }
    
    // ボタン群
    @IBAction func button0Pushed(sender: AnyObject) { addNum(0) }
    @IBAction func button1Pushed(sender: AnyObject) { addNum(1) }
    @IBAction func button2Pushed(sender: AnyObject) { addNum(2) }
    @IBAction func button3Pushed(sender: AnyObject) { addNum(3) }
    @IBAction func button4Pushed(sender: AnyObject) { addNum(4) }
    @IBAction func button5Pushed(sender: AnyObject) { addNum(5) }
    @IBAction func button6Pushed(sender: AnyObject) { addNum(6) }
    @IBAction func button7Pushed(sender: AnyObject) { addNum(7) }
    @IBAction func button8Pushed(sender: AnyObject) { addNum(8) }
    @IBAction func button9Pushed(sender: AnyObject) { addNum(9) }
    @IBAction func delButtonPushed(sender: AnyObject) { delNum() }
    @IBAction func solveButtonPushed(sender: AnyObject) { solve() }
}

