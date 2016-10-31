import Foundation
import UIKit

class Order: NSObject, NSCoding {
    
    static var currentOrder:Order = Order()
    
    var bread:String
    var meat:[String]
    var cheese:[String]
    var toppings:[String]
    
    //initiates class
    override init() {
        bread = ""
        meat = []
        cheese = []
        toppings = []
    }
    
    //loads sandwich from user defaults
    static func loadSandwich(view: UIViewController) {
        if let data = UserDefaults.standard.object(forKey: "order") {
            Order.currentOrder = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Order
        } else {
            let alertController = UIAlertController(title: "No Order Has Been Saved", message: nil, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alertController.addAction(continueAction)
            view.present(alertController, animated: true, completion: nil)
        }
    }
    
    //saves current order to user defaults
    static func saveSandwich() {
        let data = NSKeyedArchiver.archivedData(withRootObject: Order.currentOrder)
        UserDefaults.standard.set(data, forKey: "order")
    }
    
    //decodes class
    required init?(coder aDecoder: NSCoder) {
        bread = aDecoder.decodeObject(forKey: "Bread") as! String
        meat = aDecoder.decodeObject(forKey: "Meat") as! [String]
        cheese = aDecoder.decodeObject(forKey: "Chese") as! [String]
        toppings = aDecoder.decodeObject(forKey: "Toppings") as! [String]
        super.init()
        Order.currentOrder = self
    }

    //encodes class
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bread, forKey: "Bread")
        aCoder.encode(meat, forKey: "Meat")
        aCoder.encode(cheese, forKey: "Cheese")
        aCoder.encode(toppings, forKey: "Toppings")
    }
    
}
    
    
