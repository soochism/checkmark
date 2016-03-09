//
//  SecondViewController.swift
//  tab
//
//  Created by Shan-En Liu on 2/16/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var photo: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.photo.image = UIImage(named: "friends")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

