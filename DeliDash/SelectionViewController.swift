import UIKit

class SelectionViewController: UITableViewController {
   
    override func viewDidLoad() {
        Order.foodType = self.navigationItem.title!
        print(Order.foodType)
        Order.foodList.removeAll()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let text = (cell.contentView.subviews[0] as! UILabel).text!
        
        if cell.accessoryType == .none {
            cell.accessoryType = .checkmark
            Order.foodList.append(text)
        } else {
            cell.accessoryType = .none
            Order.foodList.remove(at: Order.foodList.index(of: text)!)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool{
        if Order.numberOfBreads() == 1 || Order.foodType == "Salad" {
            return true;
        } else {
            let message = "There must be exactly one bread type chosen to complete order"
            let alertController = UIAlertController(title: "Unable To Complete Order", message: message, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Understood", style: .default, handler: nil)
            alertController.addAction(continueAction)
            self.present(alertController, animated: true, completion: nil)
            return false;
        }
    }

}
