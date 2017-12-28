import UIKit

class SelectionViewController: UITableViewController {
   
    static var breadIndexPath:IndexPath? = nil

    override func viewDidLoad() {
        Order.currentOrder = Order()
        SelectionViewController.breadIndexPath = nil
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        let text = (cell.contentView.subviews[0] as! UILabel).text!
        let type = optionType(indexPath: indexPath)
        
        if type == "Bread" {
            if SelectionViewController.breadIndexPath != nil {
                tableView.cellForRow(at: SelectionViewController.breadIndexPath!)?.accessoryType = .none
            }
            SelectionViewController.breadIndexPath = indexPath
            Order.currentOrder.bread = text
            cell.accessoryType = .checkmark
        } else {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                switch type {
                case "Meat": Order.currentOrder.meat.append(text)
                case "Cheese": Order.currentOrder.cheese.append(text)
                default: Order.currentOrder.toppings.append(text)
                }
            } else {
                cell.accessoryType = .none
                switch type {
                case "Meat": Order.currentOrder.meat.remove(at: Order.currentOrder.meat.index(of: text)!)
                case "Cheese": Order.currentOrder.cheese.remove(at: Order.currentOrder.cheese.index(of: text)!)
                default: Order.currentOrder.toppings.remove(at: Order.currentOrder.toppings.index(of: text)!)

                }
            }
        }
        
        
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Order.currentOrder.bread != "" {
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
    
    func optionType(indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0: return "Bread"
        case 1: return "Meat"
        case 2: return "Cheese"
        default: return "Toppings"
        }
    }
    
    func optionArray(type: String) -> [String]? {
        switch type {
        case "Meat": return Order.currentOrder.meat
        case "Cheese": return Order.currentOrder.cheese
        case "Toppings": return Order.currentOrder.toppings
        default: return nil
        }
    }

}
