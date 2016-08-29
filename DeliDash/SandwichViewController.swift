//
//  SandwichViewController.swift
//  DeliDash
//
//  Created by Alexander Leininger on 6/1/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit


class SandwichViewController: UIViewController {

    //Buttons and their stackviews
    @IBOutlet weak var breadBox: UIStackView!
    
    @IBOutlet weak var breadButton: UIButton!
   
    @IBOutlet weak var toppingsBox: UIStackView!
    
    @IBOutlet weak var toppingsButton: UIButton!
    
    @IBOutlet weak var cheeseBox: UIStackView!
   
    @IBOutlet weak var cheeseButton: UIButton!
    
    @IBOutlet weak var meatBox: UIStackView!
    
    @IBOutlet weak var meatButton: UIButton!
    
    @IBAction func willCheckout(sender: AnyObject) {

        for toppingType in [breadBox, toppingsBox,cheeseBox,meatBox] {
            for topping in toppingType.subviews {
                if (topping as! CheckBox).isChecked {
                    Order.foodList.append((topping as! CheckBox).currentTitle!)
                }
            }
        }
    }
    
    
   //button functions
    @IBAction func breadClicked(sender: AnyObject) {
        if (breadButton.currentTitle == "Bread")
        {
            breadButton.setTitle("Ok", forState: .Normal)
            breadBox.hidden = false
            toppingsButton.hidden = true
            cheeseButton.hidden = true
            meatButton.hidden = true
        }
        else
        {
            breadButton.setTitle("Bread", forState: .Normal)
            breadBox.hidden = true
            toppingsButton.hidden = false
            cheeseButton.hidden = false
            meatButton.hidden = false
        }
    }
    
    @IBAction func toppingsClicked(sender: AnyObject) {
        if (toppingsButton.currentTitle == "Toppings")
        {
            toppingsButton.setTitle("Ok", forState: .Normal)
            toppingsBox.hidden = false
            breadButton.hidden = true
            cheeseButton.hidden = true
            meatButton.hidden = true
        }
        else
        {
            toppingsButton.setTitle("Toppings", forState: .Normal)
            toppingsBox.hidden = true
            breadButton.hidden = false
            cheeseButton.hidden = false
            meatButton.hidden = false
        }

    }
    
    @IBAction func cheeseClicked(sender: AnyObject) {
        
        if (cheeseButton.currentTitle == "Cheese")
        {
            cheeseButton.setTitle("Ok", forState: .Normal)
            cheeseBox.hidden = false
            toppingsButton.hidden = true
            breadButton.hidden = true
            meatButton.hidden = true
        }
        else
        {
            cheeseButton.setTitle("Cheese", forState: .Normal)
            cheeseBox.hidden = true
            toppingsButton.hidden = false
            breadButton.hidden = false
            meatButton.hidden = false
        }

    }
    
    
    @IBAction func meatClicked(sender: AnyObject) {
        
        if (meatButton.currentTitle == "Meat")
        {
            meatButton.setTitle("Ok", forState: .Normal)
            meatBox.hidden = false
            toppingsButton.hidden = true
            cheeseButton.hidden = true
            breadButton.hidden = true
        }
        else
        {
            meatButton.setTitle("Meat", forState: .Normal)
            meatBox.hidden = true
            toppingsButton.hidden = false
            cheeseButton.hidden = false
            breadButton.hidden = false
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
