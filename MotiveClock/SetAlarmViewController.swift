//
//  SetAlarmViewController.swift
//  MotiveClock
//
//  Created by Zhang Jialiang on 8/10/16.
//  Copyright © 2016 Zhang Jialiang. All rights reserved.
//

import UIKit

class SetAlarmViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var atlabel: UILabel!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var backgroundView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.addTarget(self, action: #selector(SetAlarmViewController.dataPickerChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataPickerChanged(picker:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
    
        dateFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let strDate = dateFormatter.stringFromDate(picker.date)
        timeLabel.text = strDate
    }
    
    @IBAction func presentPicker() {
        if timePicker.hidden == true {
            fadeInView(timePicker, duration:1.0)
            fadeInView(toolBar, duration: 1.0)
            fadeOutView(startButton, duration: 1.0)
        }
    }
    
    
    
    @IBAction func confirmTime() {
        fadeOutView(timePicker, duration:1.0)
        fadeOutView(toolBar, duration: 1.0)
        fadeInView(startButton, duration: 1.0)
    }
    
    func dragToCancel(recognizer:UIGestureRecognizer) {
        
    }
    
    @IBAction func startAlarm() {
        
        UIView.animateWithDuration(1.0) {
            self.atlabel.hidden = false
            self.backgroundView.backgroundColor = UIColor.blackColor()
            self.backgroundView.hidden = false
            self.atlabel.textColor = UIColor.whiteColor()
            self.textLabel.textColor = UIColor.whiteColor()
            self.textLabel.text = "See you tomorrow"
            self.timeLabel.textColor = UIColor.whiteColor()
            self.startButton.hidden = true
            self.tabBarController?.tabBar.hidden = true
        }
        
        
        let recognizer = UIPanGestureRecognizer()
        recognizer.addTarget(self, action: #selector(SetAlarmViewController.dragToCancel))
        backgroundView.addGestureRecognizer(recognizer)
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
