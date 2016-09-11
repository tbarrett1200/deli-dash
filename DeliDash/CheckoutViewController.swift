import UIKit
import MessageUI

class CheckoutViewController: UIViewController {
    
    override func viewDidLoad() {
        let label = self.view.subviews[0] as! UILabel
        
        label.text?.append(":\n");
        for item in Order.foodList {
            label.text?.append(item + "\n")
        }
        
        print(Order.foodList)
       
    }
    
    func sendEmail() {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.setSubject("Deli Order")
            mail.setMessageBody("The actual ordering part not set up yet", isHTML: false)
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
