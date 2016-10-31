import UIKit
import FirebaseDatabase

class CheckoutViewController: UIViewController {
    
    //the label on which to display order to user
    @IBOutlet weak var foodLabel: UILabel!
    
    //displays order in label
    override func viewDidLoad() {
        let label = self.view.subviews[0] as! UILabel
                
        label.text?.append(Order.currentOrder.bread + "\n")

        for item in Order.currentOrder.meat {
            label.text?.append(item + "\n")
        }
        
        for item in Order.currentOrder.cheese {
            label.text?.append(item + "\n")
        }

        for item in Order.currentOrder.toppings {
            label.text?.append(item + "\n")
        }

    }
    
    //restarts ordering process
    @IBAction func startOver(_ sender: AnyObject) {
        
        let _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    //saves order to file and alerts user
    @IBAction func saveOrder(_ sender: UIButton) {
        Order.saveSandwich()
        let alertController = UIAlertController(title: "Your Order Has Been Saved", message: nil, preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alertController.addAction(continueAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //sends order to online database
    @IBAction func completeOrder(_ sender: AnyObject) {
        let dataRef = FIRDatabase.database().reference(withPath: MenuViewController.nameData!)
        let breadRef = dataRef.child("Bread")
        breadRef.setValue(Order.currentOrder.bread)
        let meatRef = dataRef.child("Meat")
        meatRef.setValue(Order.currentOrder.meat)
        let cheeseRef = dataRef.child("Cheese")
        cheeseRef.setValue(Order.currentOrder.cheese)
        let toppingsRef = dataRef.child("Toppings")
        toppingsRef.setValue(Order.currentOrder.toppings)

    }

    
}
