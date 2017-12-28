//
//  ViewController.swift
//  DeliDash
//
//  Created by Alexander Leininger on 5/13/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITextFieldDelegate{
   
    //Constraints
    @IBOutlet weak var dataBoxBottomConstraint: NSLayoutConstraint!

    //Views
    @IBOutlet weak var dataBox: UIView!
    @IBOutlet weak var nameBox: UITextField!
    
    //Actions
    @IBAction func readyToOrder(_ sender: UIButton) {
        Order.currentUser = nameBox.text!
    }
    
    //Properties
    var regularOffset: CGFloat = 0.0
    
    //Constants
    let startTime = 6.0 //6:00
    let endTime = 10.0 //10:00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameBox.delegate = self;
        regularOffset = dataBoxBottomConstraint.constant
        registerForKeyboardNotifications();
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        if Order.currentUser != ""
        {
            if isValidTime() == false {
                let message = "Try again between 6:00 and 10:00"
                let alertController = UIAlertController(title: "A Sandwich Cannot Be Ordered At This Time", message: message, preferredStyle: .alert)
                let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
                alertController.addAction(continueAction)
                self.present(alertController, animated: true, completion: nil)
                return false
            }
            return true
        }
        return false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameBox.resignFirstResponder()
        return true
    }
    
    ///Returns true if it is a valid time to order a sandwich
    func isValidTime() -> Bool {
        let date = Date()
        let calendar = NSCalendar.current
        let components = calendar.dateComponents([.hour,.minute], from: date)
        
        let hour = components.hour!
        let minute = components.minute!
        let time = Double(hour) + Double(minute)/60.0
        
        if time > startTime && time < endTime {
            return true
        }
        
        return false;
    }
    
    ///Registers this view to recieve notifications when the keyboard is being shown and hidden
    func registerForKeyboardNotifications() {
        let notify = NotificationCenter.default;
        notify.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        notify.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    ///Animates the view while the keyboard is being shown
    func keyboardWillShow(_ notification: NSNotification) {
        let userInfo = notification.userInfo!
        let height = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.height
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: duration) {
            self.dataBoxBottomConstraint.constant = self.regularOffset + height
            self.view.layoutIfNeeded()
        }
    }
    
    ///Animates the view while the keyboard is being hidden
    func keyboardWillHide(_ notification: NSNotification) {
        let userInfo = notification.userInfo!
        let duration = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
        
        UIView.animate(withDuration: duration) {
            self.dataBoxBottomConstraint.constant = self.regularOffset
            self.view.layoutIfNeeded()
        }
    }
    
}

