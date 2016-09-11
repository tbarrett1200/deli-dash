import UIKit
import MessageUI

class CheckoutViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        let label = self.view.subviews[0] as! UILabel
        
        label.text?.appendContentsOf(":\n");
        for item in Order.foodList {
            label.text?.appendContentsOf(item + "\n")
        }
        
        print(Order.foodList)
       
    }
    @IBOutlet weak var foodLabel: UILabel!
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func sendMail(sender: AnyObject) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.delegate = self as? UINavigationControllerDelegate
            mail.setToRecipients(["chasandwich@gmail.com"])
            mail.setSubject("Deli Order")
            mail.setMessageBody(foodLabel.text!, isHTML: false)
            self.presentViewController(mail, animated: true, completion: nil)
        } else {
            let message = "Make sure to set up your email account in the Mail app before continuing"
            let alertController = UIAlertController(title: "Unable To Send Email", message: message, preferredStyle: .Alert)
            let continueAction = UIAlertAction(title: "Continue", style: .Default, handler: nil)
            alertController.addAction(continueAction)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

}
