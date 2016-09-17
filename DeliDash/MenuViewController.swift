//
//  ViewController.swift
//  DeliDash
//
//  Created by Alexander Leininger on 5/13/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
   
    @IBOutlet weak var nameBox: UITextField!
    
    var nameData: String?
       @IBAction func button(_ sender: UIButton) {
        
        nameData = nameBox.text}

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        if nameData != ""
        {
            let date = Date()
            let calendar = NSCalendar.current
            let components = calendar.dateComponents([.hour,.minute], from: date)
            if components.hour! >= 5 && components.hour!<10
            {
                return true
            } else {
                let message = "Try again between the hours of 5:00 AM and 10 AM"
                let alertController = UIAlertController(title: "A Sandwich Cannot Be Ordered At This Time", message: message, preferredStyle: .alert)
                let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
                alertController.addAction(continueAction)
                self.present(alertController, animated: true, completion: nil)
                return false
            }
        }
        return false;
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

