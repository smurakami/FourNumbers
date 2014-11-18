//
//  ViewController.swift
//  FourNumbers
//
//  Created by 村上晋太郎 on 2014/11/18.
//  Copyright (c) 2014年 村上晋太郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var s = Solver()
        s.solve(s.numbers);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

