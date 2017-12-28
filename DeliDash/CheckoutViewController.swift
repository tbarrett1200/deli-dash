import UIKit
import FirebaseDatabase
import MessageUI

class CheckoutViewController: UIViewController, MFMailComposeViewControllerDelegate{
    
    //the label on which to display order to user
    @IBOutlet weak var foodLabel: UILabel!
    
    //displays order in label
    override func viewDidLoad() {
        foodLabel.text = Order.currentOrder.stringValue()
    }
    
    //restarts ordering process
    @IBAction func startOver(_ sender: AnyObject) {
        let _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    //saves order to file and alerts user
    @IBAction func saveOrder(_ sender: UIButton) {
        Order.currentOrder.save()
        let alertController = UIAlertController(title: "Your Order Has Been Saved", message: nil, preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alertController.addAction(continueAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //sends order to online database
    @IBAction func completeOrder(_ sender: AnyObject) {
        sendWithEmail()
    }
    
    
    //Email Functions
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func sendWithEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["chasandwich@gmail.com"])
            mail.setSubject("Deli Order from " + Order.currentUser)
            mail.setMessageBody(Order.currentOrder.stringValue() + "\nThank You", isHTML: false)
            self.present(mail, animated: true, completion: nil)
        } else {
            let message = "Make sure to set up your email account in the Mail app before continuing"
            let alertController = UIAlertController(title: "Unable To Send Email", message: message, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alertController.addAction(continueAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    

    //Firebase Functions
    func sendToFirebase() {
        let dataRef = FIRDatabase.database().reference(withPath: Order.currentUser)
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
