//
//  FriendsDetails.swift
//  tab
//
//  Created by Shan-En Liu on 3/7/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit

class FriendsDetails: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var FriendsPhoto: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.FriendsPhoto.image = UIImage(named: "friends")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var CallFriend: UIButton!
    @IBAction func CallFriendAction(sender: UIButton) {
        let picker = UIImagePickerController()
        
        picker.delegate = self
        picker.sourceType = .Camera
        
        presentViewController(picker, animated: true, completion: nil)
        
    }
}
