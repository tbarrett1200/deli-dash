import Foundation

class Order: NSObject, NSCoding {
    
    static var currentOrder:Order = Order()
    
    var foodType:String
    var foodList:[String]
    
    override init() {
        foodType = ""
        foodList = []
        super.init()
    }
    
    static func loadSandwich() {
        let data = NSUserDefaults.standardUserDefaults().objectForKey("savedOrder") as! NSData
        Order.currentOrder = NSKeyedUnarchiver.unarchiveObjectWithData(data) as! Order
    }
    
    required init?(coder aDecoder: NSCoder) {
        foodType = aDecoder.decodeObjectForKey("foodType") as! String
        foodList = aDecoder.decodeObjectForKey("foodList") as! [String]
        super.init()
        Order.currentOrder = self
    }

    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(foodType, forKey: "foodType")
        aCoder.encodeObject(foodList, forKey: "foodList")
        
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
    
    