//
//  ViewController.swift
//  DeliDash
//
//  Created by Alexander Leininger on 5/13/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var nameBox: UITextField!
    
    var nameData: String?
       @IBAction func button(sender: UIButton) {
        
        nameData = nameBox.text}

    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool{
        if nameData != ""
        {
            return true;
        }
        return false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

