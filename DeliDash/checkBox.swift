//
//  checkBox.swift
//  DeliDash
//
//  Created by Alexander Leininger on 5/31/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class checkBox: UIButton {

    //images
    let checkedImage = UIImage(named: "checked")
    let uncheckedImage = UIImage(named: "unchecked")
    
    //Bool Property
    var isChecked:Bool = false{

    didSet{
        if isChecked == true{
            self.setImage(checkedImage, forState: .Normal)
            }
        else{
            self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(checkBox.buttonClicked(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            self.isChecked = false
    }

    func buttonClicked(sender:UIButton){
        
        if(sender == self)
        {
            if isChecked == true
            {
                
                isChecked = false
                
            }
            else
            {
                isChecked = true
            }
        }
    }
}
