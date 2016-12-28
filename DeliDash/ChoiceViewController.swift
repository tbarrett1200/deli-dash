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
        if Order.currentOrder.load() == false {
            let alertController = UIAlertController(title: "No Order Has Been Saved", message: nil, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alertController.addAction(continueAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
