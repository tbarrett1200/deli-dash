import UIKit

class SelectionViewController: UITableViewController {
   
    override func viewDidLoad() {
        Order.foodType = self.navigationItem.title!
        print(Order.foodType)
        Order.foodList.removeAll()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        let text = (cell.contentView.subviews[0] as! UILabel).text!
        
        if cell.accessoryType == .None {
            cell.accessoryType = .Checkmark
            Order.foodList.append(text)
        } else {
            cell.accessoryType = .None
            Order.foodList.removeAtIndex(Order.foodList.indexOf(text)!)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool{
        if Order.numberOfBreads() == 1 || Order.foodType == "Salad" {
            return true;
        } else {
            let message = "There must be exactly one bread type chosen to complete order"
            let alertController = UIAlertController(title: "Unable To Complete Order", message: message, preferredStyle: .Alert)
            let continueAction = UIAlertAction(title: "Understood", style: .Default, handler: nil)
            alertController.addAction(continueAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            return false;
        }
    }

}
