//
//  ViewController.swift
//  checkmark_on_tap
//
//  Created by Malcolm Carey on 2/24/16.
//  Copyright © 2016 Malcolm Carey. All rights reserved.
//

import UIKit
import SpriteKit //Fade animation

class ViewController: UIViewController {
    
    var checkImage: UIImage!
    var checkImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("makeCheckmark:"))
        view.addGestureRecognizer(tapGesture)
                
        checkImage = UIImage(named: "logo_justCheckmark_v3.png")
        checkImageView = UIImageView(image: checkImage)
        
    }
    
    func makeCheckmark(tapGesture: UITapGestureRecognizer) {
        /*
        checkImageView.center = tapGesture.locationOfTouch(0, inView: view)
        checkImageView.sizeToFit()
        view.addSubview(checkImageView)
        checkImageView.startAnimating()
        */
        var checkAnimate = SKAction.sequence([SKAction.fadeInWithDuration(1.0), SKAction.FadeOutWithDuration(1.0)])
        checkImageView.runAction(checkAnimate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

