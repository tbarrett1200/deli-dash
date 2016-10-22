import UIKit
import MessageUI

class CheckoutViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        let label = self.view.subviews[0] as! UILabel
        
        label.text?.append(":\n");
        for item in Order.currentOrder.foodList {
            label.text?.append(item + "\n")
        }
        
        print(Order.currentOrder.foodList)
        
    }
    
    @IBOutlet weak var foodLabel: UILabel!
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func startOver(_ sender: AnyObject) {
        
        let _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func saveOrder(_ sender: UIButton) {
        Order.saveSandwich()
        let alertController = UIAlertController(title: "Your Order Has Been Saved", message: nil, preferredStyle: .alert)
        let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
        alertController.addAction(continueAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func mailComposeController(controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendMail(_ sender: AnyObject) {
        
        
        
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["chasandwich@gmail.com"])
            mail.setSubject("Deli Order from") //NEED TO ADD NAME ID
            mail.setMessageBody(foodLabel.text!, isHTML: false)//ALSO ADD A "THANK" AT the End of this email
            self.present(mail, animated: true, completion: nil)
        } else {
            let message = "Make sure to set up your email account in the Mail app before continuing"
            let alertController = UIAlertController(title: "Unable To Send Email", message: message, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alertController.addAction(continueAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
