//
//  ViewController.swift
//  checkmark
//
//  Created by Soo Chan An on 2/13/16.
//  Copyright (c) 2016 checkmark. All rights reserved.
//

import UIKit

// I added this *****
import MobileCoreServices
// ******************


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // I added this *************************************
    @IBOutlet weak var Camera: UIButton!
    
    
    @IBAction func CameraAction(sender: UIButton) {
        
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
    }
    // **************************************************
    
    
}

