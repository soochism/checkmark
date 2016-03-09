//
//  Checkmarkdemo.swift
//  tab
//
//  Created by Shan-En Liu on 3/7/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit

class Checkmarkdemo: UIViewController {

    @IBOutlet weak var pic: UIImageView!
    
    var checkImage: UIImage!
    var checkImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pic.image = UIImage(named: "friends")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("makeCheckmark:"))
        view.addGestureRecognizer(tapGesture)
        
        checkImage = UIImage(named: "v3.png")
        checkImageView = UIImageView(image: checkImage)
    }
    
    func makeCheckmark(tapGesture: UITapGestureRecognizer) {
        
        checkImageView.center = tapGesture.locationOfTouch(0, inView: view)
        checkImageView.sizeToFit()
        view.addSubview(checkImageView)
        checkImageView.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
