//
//  AlarmPresenterViewController.swift
//  MotiveClock
//
//  Created by Zhang Jialiang on 8/10/16.
//  Copyright © 2016 Zhang Jialiang. All rights reserved.
//

import UIKit

class AlarmPresenterViewController: UIViewController, UITextFieldDelegate {

    
    
    @IBOutlet weak var textLabel:UILabel!
    @IBOutlet weak var textField:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let labelText = textLabel.attributedText?.string
        let inputText = NSMutableString()
        inputText.appendString(textField.text!)
        inputText.appendString(string)
        print(inputText)
        let commonPrefix = labelText!.commonPrefixWithString(inputText.lowercaseString, options: NSStringCompareOptions.CaseInsensitiveSearch)
        let myRange = NSRange(location: 0, length: commonPrefix.characters.count)
        print(commonPrefix)
        let myString = NSMutableAttributedString(string: labelText!)
        myString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: myRange)
        textLabel.attributedText = myString
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
