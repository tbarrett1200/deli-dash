//
//  ChoiceViewController.swift
//  DeliDash
//
//  Created by Thomas Barrett on 9/11/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loadOrder(_ sender: UIButton) {
        Order.loadSandwich(view: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
