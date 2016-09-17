import Foundation
import UIKit

class Order: NSObject, NSCoding {
    
    static var currentOrder:Order = Order()
    
    var foodType:String
    var foodList:[String]
    
    override init() {
        foodType = ""
        foodList = []
        super.init()
    }
    
    static func loadSandwich(view: UIViewController) {
        if let data = UserDefaults.standard.object(forKey: "savedOrder") {
            Order.currentOrder = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) as! Order

        } else {
            let alertController = UIAlertController(title: "No Order Has Been Saved", message: nil, preferredStyle: .alert)
            let continueAction = UIAlertAction(title: "Continue", style: .default, handler: nil)
            alertController.addAction(continueAction)
            view.present(alertController, animated: true, completion: nil)
        }
    }
    
    static func saveSandwich() {
        let data = NSKeyedArchiver.archivedData(withRootObject: Order.currentOrder)
        UserDefaults.standard.set(data, forKey: "savedOrder")
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodType = aDecoder.decodeObject(forKey: "foodType") as! String
        foodList = aDecoder.decodeObject(forKey: "foodList") as! [String]
        super.init()
        Order.currentOrder = self
    }

    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(foodType, forKey: "foodType")
        aCoder.encode(foodList, forKey: "foodList")
        
    }
    
    func numberOfBreads() -> Int {
        
        var breadCount = 0
        
        for breadType in ["Sub Roll","Kaiser Roll","Rye","Wheat","Wrap","Ciabatta"] {
            if foodList.contains(breadType) {
                breadCount = breadCount + 1
            }
        }
        
        return breadCount;
    }
}
    
    
