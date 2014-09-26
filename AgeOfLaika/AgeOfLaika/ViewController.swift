//
//  ViewController.swift
//  AgeOfLaika
//
//  Created by Stephane Liu on 9/17/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var ageTextField: UITextField!
  @IBOutlet weak var dogYearsLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func convertButtonPressed(sender: UIButton) {
    //if(ageTextField.text != nil) {
      let ageInteger      = ageTextField.text.toInt()!
      let conversionRate  = 7
      ageTextField.text     = ""
      dogYearsLabel.text    = "That's \(ageInteger * conversionRate) dog years!"
      dogYearsLabel.hidden  = false
      
      // Hide numeric pad
      ageTextField.resignFirstResponder()
    //}
  }

  @IBAction func convertScientificPressed(sender: UIButton) {
    //if(ageTextField.text != nil) {
      let ageInteger            = ageTextField.text.toInt()!
      let normalConversionRate  = 7.0
      var convertedAge:Double
      
      if(ageInteger <= 2) {
        convertedAge = Double(ageInteger) * normalConversionRate
      }
      else { // scientific conversion
        var initialConversion = 2.0 * 10.5
        var moreThanTwo = (ageInteger - 2) * 4
        convertedAge = initialConversion + Double(moreThanTwo)
      }
      
      ageTextField.text     = ""
      dogYearsLabel.text    = "That's \(convertedAge) dog years!"
      dogYearsLabel.hidden  = false
    
      // Hide numeric pad
      ageTextField.resignFirstResponder()
    // }
  }
  
  @IBAction func ageTextFieldEditingChanged(sender: UITextField) {
    dogYearsLabel.hidden = true
  }
}

