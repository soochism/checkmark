//
//  ViewController.swift
//  checkmark
//
//  Created by Soo Chan An on 2/13/16.
//  Copyright (c) 2016 checkmark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var TommyLoginButton: UIButton!
    
    @IBOutlet weak var FriendsLoginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var DestViewController : ViewTwo = segue.destinationViewController as! ViewTwo
        
        var LabelText = String()
        
        let button = sender as! UIButton
        switch button {
        case TommyLoginButton:
            LabelText = "Tommy"
            break;
        case FriendsLoginButton:
            LabelText = "Friend"
            break;
        default:
            break;
        }
        
        DestViewController.NameLabelText = LabelText
    }

    // MARK: Actions

    @IBAction func loginTommy(sender: UIButton) {
        
    }
}

