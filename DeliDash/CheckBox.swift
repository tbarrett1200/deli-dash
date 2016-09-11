//
//  checkBox.swift
//  DeliDash
//
//  Created by Alexander Leininger on 5/31/16.
//  Copyright © 2016 Alexander Leininger. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    //images
    let checkedImage = UIImage(named: "checked")
    let uncheckedImage = UIImage(named: "unchecked")
    
    //Bool Property
    var isChecked:Bool = false{

    didSet{
        if isChecked == true{
            self.setImage(checkedImage, for: UIControlState())
            }
        else{
            self.setImage(uncheckedImage, for: UIControlState())
            }
        }
    }
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
            self.isChecked = false
    }

    func buttonClicked(_ sender:UIButton){
        
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
