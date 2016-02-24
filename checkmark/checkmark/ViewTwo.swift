//
//  ViewTwo.swift
//  checkmark
//
//  Created by Soo Chan An on 2/23/16.
//  Copyright (c) 2016 checkmark. All rights reserved.
//

import Foundation
import UIKit

class ViewTwo : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var NameLabelText = String()
    
    override func viewDidLoad() {
        nameLabel.text = NameLabelText
        
    }
}