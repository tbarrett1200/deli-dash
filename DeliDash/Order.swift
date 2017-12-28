import Foundation
import UIKit

class Order: NSObject, NSCoding {
    
    private static let UserDefaultsKey = "Sandwich";
    
    static var currentUser: String = "";
    static var currentOrder: Order = Order();
    
    var location:String = "C Gym"
    var bread:String = ""
    var meat:[String] = []
    var cheese:[String] = []
    var toppings:[String] = []

    /**
     * Initializes an empty order
     */
    override init() {
    }
    
    ///loads sandwich from user defaults
    func load() -> Bool {
        if let object = UserDefaults.standard.object(forKey: Order.UserDefaultsKey) {
            let data = object as! Data
            let order = NSKeyedUnarchiver.unarchiveObject(with: data) as! Order;
            location = order.location
            bread = order.bread
            meat = order.meat
            cheese = order.cheese
            toppings = order.toppings
            return true;
        }
        
        return false;
    }
    
    ///saves sandwich to user defaults
    func save() {
        let data = NSKeyedArchiver.archivedData(withRootObject: self)
        UserDefaults.standard.set(data, forKey: "order")
    }
    
    ///Decoder
    required init?(coder aDecoder: NSCoder) {
        location = aDecoder.decodeObject(forKey: "Location") as! String
        bread = aDecoder.decodeObject(forKey: "Bread") as! String
        meat = aDecoder.decodeObject(forKey: "Meat") as! [String]
        cheese = aDecoder.decodeObject(forKey: "Chese") as! [String]
        toppings = aDecoder.decodeObject(forKey: "Toppings") as! [String]
        super.init()
        Order.currentOrder = self
    }
    
    ///Encoder
    func encode(with aCoder: NSCoder) {
        aCoder.encode(location, forKey: "Location")
        aCoder.encode(bread, forKey: "Bread")
        aCoder.encode(meat, forKey: "Meat")
        aCoder.encode(cheese, forKey: "Cheese")
        aCoder.encode(toppings, forKey: "Toppings")
    }
    
    func stringValue() -> String {
        
        var text = "Location: " + location + "\n\n";
            
        text += Order.currentOrder.bread + "\n"
        
        for item in Order.currentOrder.meat {
            text += item + "\n"
        }
        
        for item in Order.currentOrder.cheese {
            text += item + "\n"
        }
        
        for item in Order.currentOrder.toppings {
            text += item + "\n"
        }

        return text;
    }
    
}
    
    
