//
//  CheckmarkView.swift
//  tab
//
//  Created by Soo Chan An on 3/19/16.
//  Copyright © 2016 Shan-En Liu. All rights reserved.
//

import UIKit
import Foundation


//MARK:- Animaition Helpers

public func spring(duration: NSTimeInterval, delay: NSTimeInterval, damping: CGFloat, velocity: CGFloat, animations: () -> Void) {
    
    UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: [UIViewAnimationOptions.CurveEaseOut], animations: {
        animations()
        }, completion: nil)
}

public func animate(duration: NSTimeInterval, delay: NSTimeInterval, animations: () -> Void, completion: () -> Void) {
    
    UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
        animations()
        }, completion: { finished in
            completion()
    })
}

public func animate(duration: NSTimeInterval, delay: NSTimeInterval, animations: () -> Void) {
    
    UIView.animateWithDuration(duration, delay: delay, options: [], animations: {
        animations()
        }, completion: { finished in
    })
}

//MARK:- Math Helpers

//Briefly investigated creating a generic function to accept various numeric types.
//Seems too much work at this stage. For another time...

public func randomNumber(cap: Int) -> CGFloat {
    return CGFloat(arc4random_uniform(UInt32(cap)))
}

public func randomNumber(cap: CGFloat) -> CGFloat {
    return randomNumber(Int(cap))
}


//MARK :- CheckmarkView

let PI = CGFloat(M_PI)

class CheckmarkView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clearColor()
        layer.anchorPoint = CGPointMake(0.5, 1) //mid-bottom
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Perform the floating checkmark animation.
    ///Many of the values were adjusted to feel as nice and as close as possible to Periscope's.
    ///You should play around with different values to suit your specific use-case.
    func animateInView(view: UIView) {
        
        let totalAnimationDuration: NSTimeInterval = 6
        let checkSize = CGRectGetWidth(self.bounds)
        let checkCenterX = self.center.x
        let viewHeight = CGRectGetHeight(view.bounds)
        
        //Pre-Animation setup
        self.transform = CGAffineTransformMakeScale(0, 0)
        self.alpha = 0
        
        //Bloom
        spring(0.5, delay: 0.0, damping: 0.6, velocity: 0.8) {
            self.transform = CGAffineTransformIdentity
            self.alpha = 0.9
        }
        
        //Slight rotation
        let rotationDirection: Int = (1 - Int(2*randomNumber(2))) // -1 OR 1
        let rotationFraction = randomNumber(10)
        animate(totalAnimationDuration, delay: 0) {
            self.transform = CGAffineTransformMakeRotation(CGFloat(rotationDirection) * PI/(16 + rotationFraction*0.2))
        }
        
        
        //Travel along path
        let checkTravelPath = UIBezierPath()
        
        // FIXME: this one floats towards center of screen
//        checkTravelPath.moveToPoint(self.center)
        // FIXME: this one floats from bottom to top, given x coordinate
        checkTravelPath.moveToPoint(CGPointMake(checkCenterX, viewHeight))
        
        //random end point
        let endPoint = CGPointMake(checkCenterX + (CGFloat(rotationDirection) * randomNumber(2*checkSize)), viewHeight/6.0 + randomNumber(viewHeight/4.0))
        
        //random Control Points
        let travelDirection: Int = (1 - Int(2*randomNumber(2))) // -1 OR 1
        
        //randomize x and y for control points
        let xDelta = (checkSize/2.0 + randomNumber(2*checkSize)) * CGFloat(travelDirection)
        let yDelta = max(endPoint.y ,max(randomNumber(8*checkSize), checkSize))
        
        let controlPoint1 = CGPointMake(checkCenterX + xDelta, viewHeight - yDelta)
        let controlPoint2 = CGPointMake(checkCenterX - 2*xDelta, yDelta)
        
        checkTravelPath.addCurveToPoint(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.path = checkTravelPath.CGPath
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        keyFrameAnimation.duration = totalAnimationDuration + NSTimeInterval(endPoint.y/viewHeight)
        self.layer.addAnimation(keyFrameAnimation, forKey: "positionOnPath")
        
        
        //Alpha
        animate(totalAnimationDuration, delay: 0,
            animations: {
                self.alpha = 0.0
            },
            completion: {
                self.removeFromSuperview()
            }
        )
    }
    
    
    override func drawRect(rect: CGRect) {
        let checkImage = UIImage(named: "v3")
        checkImage?.drawInRect(rect, blendMode: .Normal, alpha: 1.0)
    }
}
