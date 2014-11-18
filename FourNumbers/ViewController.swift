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

    override func viewDidLoad() {
        super.viewDidLoad()
        numLabel.text = ""
        exprLabel.text = ""
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // ボタン群
    @IBAction func button0Pushed(sender: AnyObject) {
    }
    @IBAction func button1Pushed(sender: AnyObject) {
    }
    @IBAction func button2Pushed(sender: AnyObject) {
    }
    @IBAction func button3Pushed(sender: AnyObject) {
    }
    @IBAction func button4Pushed(sender: AnyObject) {
    }
    @IBAction func button5Pushed(sender: AnyObject) {
    }
    @IBAction func button6Pushed(sender: AnyObject) {
    }
    @IBAction func button7Pushed(sender: AnyObject) {
    }
    @IBAction func button8Pushed(sender: AnyObject) {
    }
    @IBAction func button9Pushed(sender: AnyObject) {
    }
    @IBAction func delButtonPushed(sender: AnyObject) {
    }
    @IBAction func solveButtonPushed(sender: AnyObject) {
        var s = Solver(numbers:[7, 9, 8, 5], target: 10);
        s.solve()
        println("\(s.target) = \(s.answer)")
    }
}

