//
//  Animator.swift
//  SamTurnbull
//
//  Created by Sam Turnbull on 22/04/2015.
//  Copyright (c) 2015 Sam's Software. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerAnimatedTransitioning {
    
    var presenting: Bool!
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.8
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        // I should animate auto layout constraints instead
        let offScreenUp = CGAffineTransformMakeTranslation(0, container.frame.height)
        let offScreenDown = CGAffineTransformMakeTranslation(0, -container.frame.height)
        
        if (presenting == true) {
            toView.transform = offScreenUp
            container.addSubview(toView)
            let duration = transitionDuration(transitionContext)
            
            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
                    fromView.transform = offScreenDown
                    toView.transform = CGAffineTransformIdentity
                }, completion: { finished in
                    transitionContext.completeTransition(true)
            })
            
        } else {
            toView.transform = offScreenDown
            container.addSubview(toView)
            let duration = transitionDuration(transitionContext)

            UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
                    fromView.transform = offScreenUp
                    toView.transform = CGAffineTransformIdentity
                }, completion: { finished in
                    transitionContext.completeTransition(true)
            })
        }
    }
}
