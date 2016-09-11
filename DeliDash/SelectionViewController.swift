import UIKit

class SelectionViewController: UITableViewController {
   
    override func viewDidLoad() {
        Order.currentOrder.foodType = self.navigationItem.title!
        print(Order.currentOrder.foodType)
        Order.currentOrder.foodList.removeAll()
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        let text = (cell.contentView.subviews[0] as! UILabel).text!
        
        if cell.accessoryType == .None {
            cell.accessoryType = .Checkmark
            Order.currentOrder.foodList.append(text)
        } else {
            cell.accessoryType = .None
            Order.currentOrder.foodList.removeAtIndex(Order.currentOrder.foodList.indexOf(text)!)
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool{
        if Order.currentOrder.numberOfBreads() == 1 || Order.currentOrder.foodType == "Salad" {
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
