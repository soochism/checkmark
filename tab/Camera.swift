//
//  Camera.swift
//  tab
//
//  Created by Shan-En Liu on 2/23/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit
import MobileCoreServices

class Camera: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var Camera: UIButton!
    
    @IBAction func CameraAction(sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    
    
    }
}
