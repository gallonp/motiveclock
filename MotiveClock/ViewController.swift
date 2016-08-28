//
//  ViewController.swift
//  MotiveClock
//
//  Created by Zhang Jialiang on 8/9/16.
//  Copyright © 2016 Zhang Jialiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}



extension UIViewController {
    func fadeInView(thisView:UIView,duration: NSTimeInterval) {
        thisView.hidden = false
        thisView.alpha = 0.0
        UIView.animateWithDuration(duration) {
            thisView.alpha = 1.0
        }
    }
    
    
    func fadeOutView(thisView:UIView, duration:NSTimeInterval) {
        thisView.alpha = 1.0
        UIView.animateWithDuration(duration) {
            thisView.alpha = 0.0
        }
        thisView.hidden = true
    }
}