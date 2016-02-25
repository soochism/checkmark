//
//  ViewController.swift
//  checkmark_on_tap
//
//  Created by Malcolm Carey on 2/24/16.
//  Copyright © 2016 Malcolm Carey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var checkLabel: UILabel!
    var checkImage: UIImage!
    var checkImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("makeCheckmark:"))
        view.addGestureRecognizer(tapGesture)
        
        checkLabel = UILabel()
        
        checkImage = UIImage(named: "logo_justCheckmark_v2.png")
        checkImageView = UIImageView(image: checkImage)
    }
    
    func makeCheckmark(tapGesture: UITapGestureRecognizer) {
        //print("tap")
        
        //checkLabel.text = "check"
        //checkLabel.font = UIFont.systemFontOfSize(36)
        //checkLabel.sizeToFit()
        //checkLabel.center = tapGesture.locationOfTouch(0, inView: view)
        //view.addSubview(checkLabel)
        
        checkImageView.center = tapGesture.locationOfTouch(0, inView: view)
        checkImageView.sizeToFit()
        view.addSubview(checkImageView)
        checkImageView.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

